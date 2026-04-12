// Инициализация выходов
const outputs = [null, null, msg];

// Глобальный кэш для отслеживания зарегистрированных устройств
const registeredDevices = new Set();

// Кэш для отслеживания таймеров сброса состояния выключателей
const switchTimers = new Map();

try {
    // Проверка входящего сообщения
    if (!msg.payload?.message || typeof msg.payload.message !== 'string') {
        return outputs;
    }

    // Парсинг топика
    const topicMatch = msg.payload.message.match(/topic\s+'([^']+)'/);
    if (!topicMatch?.[1]) return outputs;
    const topic = topicMatch[1];

    // Парсинг payload
    const payloadMatch = msg.payload.message.match(/payload\s+'({.*?})'/);
    if (!payloadMatch?.[1]) return outputs;

    const payload = JSON.parse(payloadMatch[1]);

    // Обработка событий bridge для регистрации устройств
    if (topic === 'zigbee2mqtt/bridge/event') {
        if (payload.type === 'device_interview' && payload.data?.definition) {
            const deviceId = `zigbee-${payload.data.id}`;

            if (!registeredDevices.has(deviceId)) {
                const deviceInfo = createDeviceFromDefinition(payload.data.definition, deviceId);

                if (deviceInfo) {
                    outputs[1] = {
                        payload: [{
                            type: "searchZigbeeDevicesResult",
                            devices: [deviceInfo]
                        }]
                    };
                    registeredDevices.add(deviceId);
                }
            }
        }
        return outputs;
    }

    // Обработка networkmap
    if (topic === 'zigbee2mqtt/bridge/response/networkmap') {
        if (payload.data?.value?.links) {
            const networkInfo = processNetworkMap(payload.data.value.links);
            outputs[0] = {
                payload: [{
                    type: "zigbeeNetworkMap",
                    data: networkInfo
                }]
            };
        }
        return outputs;
    }

    // Проверка что это zigbee2mqtt устройство
    const zigbeeIdMatch = topic.match(/zigbee2mqtt\/(0x[^/]+)/);
    if (!zigbeeIdMatch?.[1]) return outputs;
    const baseId = zigbeeIdMatch[1];

    // Определение типа устройства
    let deviceId, deviceType, actionMsg, deviceInfo;
    const isNewDevice = true

    // Обработка моторов для штор
    if (payload.open !== undefined || (payload.state !== undefined && ['OPEN', 'CLOSE', 'STOP'].includes(payload.state))) {
        deviceType = "openable_curtain";
        deviceId = `curtain-${baseId}`;

        // Формирование свойств
        const properties = [];
        const capabilities = [];
        let deviceName = "Мотор шторы";

        // Свойство состояния
        if (payload.state !== undefined) {
            const stateMap = {
                'OPEN': 'opened',
                'CLOSE': 'closed',
                'STOP': 'stopped'
            };
            const stateValue = stateMap[payload.state] || payload.state.toLowerCase();
            properties.push({
                type: "event",
                state: { instance: "open", value: stateValue },
                parameters: {
                    instance: "open",
                    events: [
                        { value: "opened", name: "Открыто" },
                        { value: "closed", name: "Закрыто" },
                        { value: "stopped", name: "Остановлено" }
                    ]
                }
            });
        }

        // Свойство позиции
        if (payload.position !== undefined) {
            capabilities.push({
                type: "range",
                state: { instance: "open", value: payload.position },
                parameters: {
                    random_access: true,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "open"
                }
            });
        }

        // Батарея
        if (payload.battery !== undefined) {
            properties.push({
                type: "float",
                state: { instance: "battery", value: payload.battery },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Освещенность
        if (payload.illuminance !== undefined) {
            properties.push({
                type: "float",
                state: { instance: "illuminance", value: payload.illuminance },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: null,
                    instance: "illuminance"
                }
            });
        }

        // Режим открытия
        if (payload.opening_mode !== undefined) {
            properties.push({
                type: "event",
                state: { instance: "opening_mode", value: payload.opening_mode },
                parameters: {
                    instance: "opening_mode",
                    events: [
                        { value: "tilt", name: "Наклон" },
                        { value: "lift", name: "Подъем" }
                    ]
                }
            });
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: capabilities,
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "openable_curtain",
                id: deviceId,
                name: deviceName,
                capabilities: capabilities,
                properties: properties
            };
        }
    }
    // Обработка климатического датчика
    else if (payload.temperature !== undefined || payload.humidity !== undefined) {
        deviceType = "climate";
        deviceId = `climate-${baseId}`;

        // Формирование свойств
        const properties = [];
        let deviceName = "Датчик климата";

        if (payload.temperature !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.temperature, instance: "temperature" },
                parameters: {
                    random_access: null,
                    unit: "unit.celsius",
                    range: null,
                    instance: "temperature"
                }
            });
            deviceName = "Датчик температуры";
        }

        if (payload.humidity !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.humidity, instance: "humidity" },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: null,
                    instance: "humidity"
                }
            });
            deviceName = properties.length > 1
                ? "Датчик температуры и влажности"
                : "Датчик влажности";
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_climate",
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }

    else if (payload.action !== undefined && !payload.action.match(/^(single|double|long)$/)) {
        node.log("Обработка переключателя");
        deviceType = "sensor_button";
        deviceId = `switch-${baseId}`;

        // Маппинг действий на состояния для двух клавиш
        const actionMapping = {
            // Первая клавиша
            "1_single": { button: 1, action: "click" },
            "1_double": { button: 1, action: "double_click" },
            "1_long": { button: 1, action: "long_press" },
            "toggle_b1_up": { button: 1, action: "up" },
            "toggle_b1_down": { button: 1, action: "down" },
            "toggle_up": { button: 1, action: "up" },

            // Вторая клавиша
            "2_single": { button: 2, action: "click" },
            "2_double": { button: 2, action: "double_click" },
            "2_long": { button: 2, action: "long_press" },
            "toggle_b2_up": { button: 2, action: "up" },
            "toggle_b2_down": { button: 2, action: "down" },
        };

        const mappedAction = actionMapping[payload.action];
        if (!mappedAction) return outputs;

        const { button, action } = mappedAction;

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: `${deviceId}_${button}`,
            capabilities: [],
            properties: [{
                type: "event",
                state: { instance: "button", value: action },
                parameters: {
                    instance: "button",
                    events: [
                        { value: "click", name: "Одно нажатие" },
                        { value: "double_click", name: "Двойное нажатие" },
                        { value: "long_press", name: "Долгое нажатие" }
                    ]
                }
            }]
        };

        // Устанавливаем таймер для сброса состояния через 2 секунды
        // const timerKey = `${deviceId}_button_${button}`;
        // if (switchTimers.has(timerKey)) {
        //     clearTimeout(switchTimers.get(timerKey));
        // }

        // const timerId = setTimeout(() => {
        // Создаем сообщение для сброса состояния
        const resetMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: `${deviceId}_${button}`,
            capabilities: [],
            properties: [{
                type: "event",
                state: { instance: "button", value: "click" },
                parameters: {
                    instance: "button",
                    events: [
                        { value: "click", name: "Одно нажатие" },
                        { value: "double_click", name: "Двойное нажатие" },
                        { value: "long_press", name: "Долгое нажатие" }
                    ]
                }
            }]
        };

        // Отправляем сообщение сброса
        node.send([{ payload: [resetMsg] }, null, msg]);
        //     switchTimers.delete(timerKey);
        // }, 2000);

        // switchTimers.set(timerKey, timerId);

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_button",
                id: `${deviceId}_${button}`,
                name: "Выключатель Zigbee",
                capabilities: [],
                properties: [
                    // Кнопка 1
                    {
                        type: "event",
                        state: { instance: "button", value: "click" },
                        parameters: {
                            instance: "button",
                            events: [
                                { value: "click", name: "Одно нажатие" },
                                { value: "double_click", name: "Двойное нажатие" },
                                { value: "long_press", name: "Долгое нажатие" }
                            ]
                        }
                    }
                ]
            };
        }
    }
    // Обработка датчика движения
    else if (payload.occupancy !== undefined) {
        deviceType = "motion";
        deviceId = `motion-${baseId}`;

        // Формирование события движения
        const motionValue = payload.occupancy ? "detected" : "not_detected";
        const motionEvent = {
            type: "event",
            state: { instance: "motion", value: motionValue },
            parameters: {
                instance: "motion",
                events: [
                    { value: "detected", name: "движение" },
                    { value: "not_detected", name: "нет движения" }
                ]
            }
        };

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: [motionEvent]
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_motion",
                id: deviceId,
                name: "Датчик движения",
                capabilities: [],
                properties: [{
                    ...motionEvent,
                    state: { instance: "motion", value: motionValue }
                }]
            };
        }
    }
    // Обработка датчика дыма
    else if (payload.smoke !== undefined) {
        deviceType = "smoke";
        deviceId = `smoke-${baseId}`;

        // Формирование событий
        const properties = [];
        let deviceName = "Датчик дыма";

        // Событие дыма
        if (payload.smoke !== undefined) {
            const smokeValue = payload.smoke ? "detected" : "not_detected";
            properties.push({
                type: "event",
                state: { instance: "smoke", value: smokeValue },
                parameters: {
                    instance: "smoke",
                    events: [
                        { value: "detected", name: "дым обнаружен" },
                        { value: "not_detected", name: "дым не обнаружен" }
                    ]
                }
            });
        }

        // Событие вскрытия
        if (payload.tamper !== undefined) {
            const tamperValue = payload.tamper ? "detected" : "not_detected";
            properties.push({
                type: "event",
                state: { instance: "tamper", value: tamperValue },
                parameters: {
                    instance: "tamper",
                    events: [
                        { value: "detected", name: "вскрытие" },
                        { value: "not_detected", name: "норма" }
                    ]
                }
            });
        }

        // Батарея
        if (payload.battery !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.battery, instance: "battery" },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_smoke",
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }
    // Обработка датчика открытия/контакта
    else if (payload.contact !== undefined) {
        deviceType = "sensor_open";
        deviceId = `contact-${baseId}`;

        // Формирование событий
        const properties = [];
        let deviceName = "Датчик открытия";

        // Событие контакта
        const contactValue = payload.contact ? "closed" : "opened";
        properties.push({
            type: "event",
            state: { instance: "open", value: contactValue },
            parameters: {
                instance: "contact",
                events: [
                    { value: "opened", name: "открыто" },
                    { value: "closed", name: "закрыто" }
                ]
            }
        });

        // Батарея
        if (payload.battery !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.battery, instance: "battery" },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Событие вскрытия (если есть)
        if (payload.tamper !== undefined) {
            const tamperValue = payload.tamper ? "detected" : "not_detected";
            properties.push({
                type: "event",
                state: { instance: "tamper", value: tamperValue },
                parameters: {
                    instance: "tamper",
                    events: [
                        { value: "detected", name: "вскрытие" },
                        { value: "not_detected", name: "норма" }
                    ]
                }
            });
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_open",
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }
    // Обработка датчика протечки воды
    else if (payload.water_leak !== undefined) {
        deviceType = "water_leak";
        deviceId = `water_leak-${baseId}`;

        // Формирование событий
        const properties = [];
        let deviceName = "Датчик протечки воды";

        // Событие протечки
        const leakValue = payload.water_leak ? "detected" : "not_detected";
        properties.push({
            type: "event",
            state: { instance: "water_leak", value: leakValue },
            parameters: {
                instance: "water_leak",
                events: [
                    { value: "detected", name: "протечка обнаружена" },
                    { value: "not_detected", name: "протечки нет" }
                ]
            }
        });

        // Событие низкого заряда батареи
        if (payload.battery_low !== undefined) {
            const batteryLowValue = payload.battery_low ? "low" : "normal";
            properties.push({
                type: "event",
                state: { instance: "battery", value: batteryLowValue },
                parameters: {
                    instance: "battery",
                    events: [
                        { value: "low", name: "низкий заряд" },
                        { value: "normal", name: "нормальный заряд" }
                    ]
                }
            });
        }

        // Уровень батареи
        if (payload.battery !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.battery, instance: "battery_level" },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery_level"
                }
            });
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_water_leak",
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }
    // Обработка датчика вибрации
    else if (payload.vibration !== undefined) {
        deviceType = "vibration";
        deviceId = `vibration-${baseId}`;

        // Формирование событий
        const properties = [];
        let deviceName = "Датчик вибрации";

        // Событие вибрации
        const vibrationValue = payload.vibration ? "detected" : "not_detected";
        properties.push({
            type: "event",
            state: { instance: "vibration", value: vibrationValue },
            parameters: {
                instance: "vibration",
                events: [
                    { value: "detected", name: "вибрация обнаружена" },
                    { value: "not_detected", name: "вибрации нет" }
                ]
            }
        });

        // Уровень батареи
        if (payload.battery !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.battery, instance: "battery" },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Напряжение батареи
        if (payload.voltage !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.voltage, instance: "voltage" },
                parameters: {
                    random_access: null,
                    unit: "unit.volt",
                    range: null,
                    instance: "voltage"
                }
            });
        }

        // Чувствительность (если есть)
        if (payload.sensitivity !== undefined) {
            properties.push({
                type: "float",
                state: { value: payload.sensitivity, instance: "sensitivity" },
                parameters: {
                    random_access: true,
                    unit: null,
                    range: { min: 0, max: 50 },
                    instance: "sensitivity"
                }
            });
        }

        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: "sensor_vibration",
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }
    // Обработка беспроводной кнопки
    else if (payload.action !== undefined && payload.action.match(/^(single|double|long)$/)) {
        node.log("Обработка беспроводной кнопки");
        deviceType = "sensor_button";
        deviceId = `button-${baseId}`;

        // Маппинг действий
        const actionMap = {
            'single': 'click',
            'double': 'double_click',
            'long': 'long_press'
        };

        // Формирование событий
        const properties = [];
        let deviceName = "Беспроводная кнопка";

        // Событие кнопки - отправляем преобразованное действие
        const buttonValue = actionMap[payload.action] || payload.action;
        properties.push({
            type: "event",
            state: { instance: "button", value: buttonValue },
            parameters: {
                instance: "button",
                events: [
                    { value: "click", name: "Одно нажатие" },
                    { value: "double_click", name: "Двойное нажатие" },
                    { value: "long_press", name: "Долгое нажатие" }
                ]
            }
        });


        // Сообщение для обновления состояния
        actionMsg = {
            type: "zigbeeDeviceChanged",
            deviceId: deviceId,
            capabilities: [],
            properties: properties
        };

        // Информация для регистрации устройства
        if (isNewDevice) {
            deviceInfo = {
                type: deviceType,
                id: deviceId,
                name: deviceName,
                capabilities: [],
                properties: properties
            };
        }
    }

    // Если устройство не распознано - выходим
    if (!deviceId) return outputs;

    // Формирование выходных данных
    outputs[0] = actionMsg ? { payload: [actionMsg] } : null;

    // Регистрация нового устройства
    if (isNewDevice && deviceInfo) {
        registeredDevices.add(baseId);
        outputs[1] = {
            payload: [{
                type: "searchZigbeeDevicesResult",
                devices: [deviceInfo]
            }]
        };
    }
}
catch (e) {
    node.error("Ошибка обработки: " + e.message, msg);
}

return outputs;

// Функция для создания устройства из определения bridge
function createDeviceFromDefinition(definition, deviceId) {
    if (!definition.exposes) return null;

    let deviceType = "sensor";
    let capabilities = [];
    let properties = [];
    let deviceName = definition.description || "Zigbee устройство";

    // Проверка на наличие cover в exposes
    const hasCover = definition.exposes.some(e => e.type === 'cover');
    if (hasCover) {
        deviceType = "openable_curtain";
        deviceName = "Мотор шторы";

        // Добавляем свойства состояния
        properties.push({
            type: "event",
            state: { instance: "state", value: "stopped" },
            parameters: {
                instance: "state",
                events: [
                    { value: "opened", name: "Открыто" },
                    { value: "closed", name: "Закрыто" },
                    { value: "stopped", name: "Остановлено" }
                ]
            }
        });

        // Добавляем свойство позиции
        properties.push({
            type: "float",
            state: { instance: "open", value: 0 },
            parameters: {
                random_access: true,
                unit: "unit.percent",
                range: { min: 0, max: 100 },
                instance: "open"
            }
        });

        // Батарея
        const batteryExpose = definition.exposes.find(e => e.name === 'battery');
        if (batteryExpose) {
            properties.push({
                type: "float",
                state: { instance: "battery", value: 100 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Освещенность
        const illuminanceExpose = definition.exposes.find(e => e.name === 'illuminance');
        if (illuminanceExpose) {
            properties.push({
                type: "float",
                state: { instance: "illuminance", value: 0 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: null,
                    instance: "illuminance"
                }
            });
        }

        // Режим открытия
        const openingModeExpose = definition.exposes.find(e => e.name === 'opening_mode');
        if (openingModeExpose) {
            properties.push({
                type: "event",
                state: { instance: "opening_mode", value: "lift" },
                parameters: {
                    instance: "opening_mode",
                    events: openingModeExpose.values.map(value => ({
                        value: value,
                        name: value === 'tilt' ? 'Наклон' : 'Подъем'
                    }))
                }
            });
        }
    }
    // Анализируем exposes для определения типа устройства
    const hasSmoke = definition.exposes.some(e => e.name === 'smoke');
    const hasTemperature = definition.exposes.some(e => e.name === 'temperature');
    const hasHumidity = definition.exposes.some(e => e.name === 'humidity');
    const hasOccupancy = definition.exposes.some(e => e.name === 'occupancy');
    const hasAction = definition.exposes.some(e => e.name === 'action' && e.values && e.values.includes("single"));
    const hasContact = definition.exposes.some(e => e.name === 'contact');
    const hasWaterLeak = definition.exposes.some(e => e.name === 'water_leak');
    const hasVibration = definition.exposes.some(e => e.name === 'vibration');
    const hasSwitchAction = definition.exposes.some(e => e.name === 'action' &&
        e.values && !e.values.includes("single") && !e.values.includes("double") && !e.values.includes("long"));

    if (hasSmoke) {
        deviceType = "sensor_smoke";
        deviceName = "Датчик дыма";

        // Добавляем свойства дыма
        properties.push({
            type: "event",
            state: { instance: "smoke", value: "not_detected" },
            parameters: {
                instance: "smoke",
                events: [
                    { value: "detected", name: "дым обнаружен" },
                    { value: "not_detected", name: "дым не обнаружен" }
                ]
            }
        });

        // Добавляем свойство батареи, если есть
        const batteryExpose = definition.exposes.find(e => e.name === 'battery');
        if (batteryExpose) {
            properties.push({
                type: "float",
                state: { instance: "battery", value: 100 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Добавляем свойство вскрытия, если есть
        const tamperExpose = definition.exposes.find(e => e.name === 'tamper');
        if (tamperExpose) {
            properties.push({
                type: "event",
                state: { instance: "tamper", value: "not_detected" },
                parameters: {
                    instance: "tamper",
                    events: [
                        { value: "detected", name: "вскрытие" },
                        { value: "not_detected", name: "норма" }
                    ]
                }
            });
        }
    } else if (hasWaterLeak) {
        deviceType = "sensor_water_leak";
        deviceName = "Датчик протечки воды";

        // Событие протечки
        properties.push({
            type: "event",
            state: { instance: "water_leak", value: "not_detected" },
            parameters: {
                instance: "water_leak",
                events: [
                    { value: "detected", name: "протечка обнаружена" },
                    { value: "not_detected", name: "протечки нет" }
                ]
            }
        });

        // Событие низкого заряда батареи
        const batteryLowExpose = definition.exposes.find(e => e.name === 'battery_low');
        if (batteryLowExpose) {
            properties.push({
                type: "event",
                state: { instance: "battery", value: "normal" },
                parameters: {
                    instance: "battery",
                    events: [
                        { value: "low", name: "низкий заряд" },
                        { value: "normal", name: "нормальный заряд" }
                    ]
                }
            });
        }

        // Уровень батареи
        const batteryExpose = definition.exposes.find(e => e.name === 'battery');
        if (batteryExpose) {
            properties.push({
                type: "float",
                state: { instance: "battery_level", value: 100 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery_level"
                }
            });
        }
    } else if (hasVibration) {
        deviceType = "sensor_vibration";
        deviceName = "Датчик вибрации";

        // Событие вибрации
        properties.push({
            type: "event",
            state: { instance: "vibration", value: "not_detected" },
            parameters: {
                instance: "vibration",
                events: [
                    { value: "detected", name: "вибрация обнаружена" },
                    { value: "not_detected", name: "вибрации нет" }
                ]
            }
        });

        // Уровень батареи
        const batteryExpose = definition.exposes.find(e => e.name === 'battery');
        if (batteryExpose) {
            properties.push({
                type: "float",
                state: { instance: "battery", value: 100 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Напряжение батареи
        const voltageExpose = definition.exposes.find(e => e.name === 'voltage');
        if (voltageExpose) {
            properties.push({
                type: "float",
                state: { instance: "voltage", value: 3000 }, // Примерное значение
                parameters: {
                    random_access: null,
                    unit: "unit.volt",
                    range: null,
                    instance: "voltage"
                }
            });
        }

        // Чувствительность
        const sensitivityExpose = definition.exposes.find(e => e.name === 'sensitivity');
        if (sensitivityExpose) {
            properties.push({
                type: "float",
                state: { instance: "sensitivity", value: 25 }, // Среднее значение
                parameters: {
                    random_access: true,
                    unit: null,
                    range: { min: 0, max: 50 },
                    instance: "sensitivity"
                }
            });
        }
    } else if (hasAction) {
        deviceType = "sensor_button";
        deviceName = "Беспроводная кнопка";

        // Событие кнопки
        properties.push({
            type: "event",
            state: { instance: "button", value: "click" },
            parameters: {
                instance: "button",
                events: [
                    { value: "click", name: "Одно нажатие" },
                    { value: "double_click", name: "Двойное нажатие" },
                    { value: "long_press", name: "Долгое нажатие" }
                ]
            }
        });
    } else if (hasSwitchAction) {
        deviceType = "switch";
        deviceName = "Выключатель Zigbee";

        // Событие действия выключателя
        properties.push({
            type: "event",
            state: { instance: "switch_action", value: "1_single" },
            parameters: {
                instance: "switch_action",
                events: [
                    { value: "1_single", name: "Одиночное нажатие кнопки 1" },
                    { value: "2_single", name: "Одиночное нажатие кнопки 2" },
                    { value: "1_double", name: "Двойное нажатие кнопки 1" },
                    { value: "2_double", name: "Двойное нажатие кнопки 2" },
                    { value: "1_long", name: "Длинное нажатие кнопки 1" },
                    { value: "2_long", name: "Длинное нажатие кнопки 2" },
                    { value: "toggle_b1_up", name: "Включение кнопки 1" },
                    { value: "toggle_b1_down", name: "Выключение кнопки 1" },
                    { value: "toggle_b2_up", name: "Включение кнопки 2" },
                    { value: "toggle_b2_down", name: "Выключение кнопки 2" },
                    { value: "toggle_up", name: "Включение" },
                    { value: "toggle_down", name: "Выключение" }
                ]
            }
        });
    } else if (hasContact) {
        deviceType = "sensor_open";
        deviceName = "Датчик открытия";

        // Событие контакта
        properties.push({
            type: "event",
            state: { instance: "open", value: "closed" },
            parameters: {
                instance: "open",
                events: [
                    { value: "opened", name: "открыто" },
                    { value: "closed", name: "закрыто" }
                ]
            }
        });

        // Батарея
        const batteryExpose = definition.exposes.find(e => e.name === 'battery');
        if (batteryExpose) {
            properties.push({
                type: "float",
                state: { instance: "battery", value: 100 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: { min: 0, max: 100 },
                    instance: "battery"
                }
            });
        }

        // Вскрытие
        const tamperExpose = definition.exposes.find(e => e.name === 'tamper');
        if (tamperExpose) {
            properties.push({
                type: "event",
                state: { instance: "tamper", value: "not_detected" },
                parameters: {
                    instance: "tamper",
                    events: [
                        { value: "detected", name: "вскрытие" },
                        { value: "not_detected", name: "норма" }
                    ]
                }
            });
        }
    } else if (hasTemperature || hasHumidity) {
        deviceType = "sensor_climate";
        deviceName = "Датчик климата";

        if (hasTemperature) {
            properties.push({
                type: "float",
                state: { instance: "temperature", value: 0 },
                parameters: {
                    random_access: null,
                    unit: "unit.celsius",
                    range: null,
                    instance: "temperature"
                }
            });
        }

        if (hasHumidity) {
            properties.push({
                type: "float",
                state: { instance: "humidity", value: 0 },
                parameters: {
                    random_access: null,
                    unit: "unit.percent",
                    range: null,
                    instance: "humidity"
                }
            });
        }
    } else if (hasOccupancy) {
        deviceType = "sensor_motion";
        deviceName = "Датчик движения";

        properties.push({
            type: "event",
            state: { instance: "motion", value: "not_detected" },
            parameters: {
                instance: "motion",
                events: [
                    { value: "detected", name: "движение" },
                    { value: "not_detected", name: "нет движения" }
                ]
            }
        });
    }

    return {
        type: deviceType,
        id: deviceId,
        name: deviceName,
        capabilities: capabilities,
        properties: properties
    };
}

// Функция для обработки networkmap
function processNetworkMap(links) {
    const devices = new Map();

    // Собираем информацию об устройстваи
    links.forEach(link => {
        if (link.sourceIeeeAddr) {
            if (!devices.has(link.sourceIeeeAddr)) {
                devices.set(link.sourceIeeeAddr, {
                    ieeeAddr: link.sourceIeeeAddr,
                    networkAddress: link.sourceNwkAddr,
                    depth: link.depth,
                    linkquality: link.linkquality,
                    relationships: [],
                    routes: link.routes || []
                });
            }

            // Обновляем информацию об устройстве
            const device = devices.get(link.sourceIeeeAddr);
            if (link.depth > device.depth) device.depth = link.depth;
            if (link.linkquality > device.linkquality) device.linkquality = link.linkquality;

            // Добавляем связь
            if (link.targetIeeeAddr && link.relationship) {
                device.relationships.push({
                    target: link.targetIeeeAddr,
                    relationship: link.relationship,
                    linkquality: link.linkquality
                });
            }
        }
    });

    // Преобразуем Map в массив
    return Array.from(devices.values());
}