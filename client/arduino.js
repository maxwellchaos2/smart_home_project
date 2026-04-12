// Оптимизированная обработка Zigbee устройств
const outputs = [null, null, msg];
const registeredDevices = new Set();

try {
    if (!msg.payload?.message || typeof msg.payload.message !== 'string') return outputs;

    const topic = (msg.payload.message.match(/topic\s+'([^']+)'/) || [])[1];
    if (!topic) return outputs;

    const payloadStr = (msg.payload.message.match(/payload\s+'({.*?})'/) || [])[1];
    if (!payloadStr) return outputs;
    const payload = JSON.parse(payloadStr);

    // Bridge event: регистрация устройств
    if (topic === 'zigbee2mqtt/bridge/event') {
        if (payload.type === 'device_interview' && payload.data?.definition) {
            const deviceId = `zigbee-${payload.data.id}`;
            if (!registeredDevices.has(deviceId)) {
                const deviceInfo = createDeviceFromDefinition(payload.data.definition, deviceId);
                if (deviceInfo) {
                    outputs[1] = { payload: [{ type: "searchZigbeeDevicesResult", devices: [deviceInfo] }] };
                    registeredDevices.add(deviceId);
                }
            }
        }
        return outputs;
    }

    // Network map
    if (topic === 'zigbee2mqtt/bridge/response/networkmap') {
        if (payload.data?.value?.links) {
            outputs[0] = { payload: [{ type: "zigbeeNetworkMap", data: processNetworkMap(payload.data.value.links) }] };
        }
        return outputs;
    }

    // Проверка zigbee2mqtt устройства
    const baseId = ((topic.match(/zigbee2mqtt\/(0x[^/]+)/) || [])[1]);
    if (!baseId) return outputs;

    let deviceId, deviceType, actionMsg, deviceInfo;
    const isNewDevice = true;

    // Универсальный генератор свойств
    function pushFloat(properties, value, instance, unit, range = null, random_access = null) {
        properties.push({
            type: "float",
            state: { value, instance },
            parameters: { random_access, unit, range, instance }
        });
    }
    function pushEvent(properties, instance, value, events) {
        properties.push({
            type: "event",
            state: { instance, value },
            parameters: { instance, events }
        });
    }

    // КЛИМАТ
    if (payload.temperature !== undefined || payload.humidity !== undefined) {
        deviceType = "climate";
        deviceId = `climate-${baseId}`;
        const properties = [];
        let deviceName = "Датчик климата";
        if (payload.temperature !== undefined) {
            pushFloat(properties, payload.temperature, "temperature", "unit.celsius");
            deviceName = "Датчик температуры";
        }
        if (payload.humidity !== undefined) {
            pushFloat(properties, payload.humidity, "humidity", "unit.percent");
            deviceName = properties.length > 1 ? "Датчик температуры и влажности" : "Датчик влажности";
        }
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_climate", id: deviceId, name: deviceName, capabilities: [], properties };
    }

    // ВЫКЛЮЧАТЕЛЬ
    if (payload.action !== undefined) {
        const switchActions = [
            { key: "1_single", id: `switch-${baseId}-01` },
            { key: "2_single", id: `switch-${baseId}-02` }
        ];
        for (const sw of switchActions) {
            if (payload.action === sw.key) {
                deviceType = "switch";
                deviceId = sw.id;
                actionMsg = {
                    type: "zigbeeDeviceChanged",
                    deviceId,
                    capabilities: [{ type: "on_off", state: { value: true, instance: "on" }, parameters: null }],
                    properties: []
                };
                if (isNewDevice) deviceInfo = {
                    type: "switch",
                    id: deviceId,
                    name: "Выключатель Zigbee",
                    capabilities: [{ type: "on_off", state: { instance: "on", value: false }, parameters: { instance: "on_off", split: false } }],
                    properties: []
                };
                break;
            }
        }
    }

    // ДАТЧИК ДВИЖЕНИЯ
    else if (payload.occupancy !== undefined) {
        deviceType = "motion";
        deviceId = `motion-${baseId}`;
        const properties = [];
        const motionValue = payload.occupancy ? "detected" : "not_detected";
        pushEvent(properties, "motion", motionValue, [
            { value: "detected", name: "движение" },
            { value: "not_detected", name: "нет движения" }
        ]);
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_motion", id: deviceId, name: "Датчик движения", capabilities: [], properties };
    }

    // ДАТЧИК ДЫМА
    else if (payload.smoke !== undefined) {
        deviceType = "smoke";
        deviceId = `smoke-${baseId}`;
        const properties = [];
        let deviceName = "Датчик дыма";
        if (payload.smoke !== undefined) {
            const smokeValue = payload.smoke ? "detected" : "not_detected";
            pushEvent(properties, "smoke", smokeValue, [
                { value: "detected", name: "дым обнаружен" },
                { value: "not_detected", name: "дым не обнаружен" }
            ]);
        }
        if (payload.tamper !== undefined) {
            const tamperValue = payload.tamper ? "detected" : "not_detected";
            pushEvent(properties, "tamper", tamperValue, [
                { value: "detected", name: "вскрытие" },
                { value: "not_detected", name: "норма" }
            ]);
        }
        if (payload.battery !== undefined) {
            pushFloat(properties, payload.battery, "battery", "unit.percent", { min: 0, max: 100 });
        }
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_smoke", id: deviceId, name: deviceName, capabilities: [], properties };
    }

    // ДАТЧИК ОТКРЫТИЯ
    else if (payload.contact !== undefined) {
        deviceType = "contact";
        deviceId = `contact-${baseId}`;
        const properties = [];
        let deviceName = "Датчик открытия";
        const contactValue = payload.contact ? "closed" : "open";
        pushEvent(properties, "contact", contactValue, [
            { value: "open", name: "открыто" },
            { value: "closed", name: "закрыто" }
        ]);
        if (payload.battery !== undefined) {
            pushFloat(properties, payload.battery, "battery", "unit.percent", { min: 0, max: 100 });
        }
        if (payload.tamper !== undefined) {
            const tamperValue = payload.tamper ? "detected" : "not_detected";
            pushEvent(properties, "tamper", tamperValue, [
                { value: "detected", name: "вскрытие" },
                { value: "not_detected", name: "норма" }
            ]);
        }
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_contact", id: deviceId, name: deviceName, capabilities: [], properties };
    }

    // ДАТЧИК ПРОТЕЧКИ ВОДЫ
    else if (payload.water_leak !== undefined) {
        deviceType = "water_leak";
        deviceId = `water_leak-${baseId}`;
        const properties = [];
        let deviceName = "Датчик протечки воды";
        const leakValue = payload.water_leak ? "detected" : "not_detected";
        pushEvent(properties, "water_leak", leakValue, [
            { value: "detected", name: "протечка обнаружена" },
            { value: "not_detected", name: "протечки нет" }
        ]);
        if (payload.battery_low !== undefined) {
            const batteryLowValue = payload.battery_low ? "low" : "normal";
            pushEvent(properties, "battery", batteryLowValue, [
                { value: "low", name: "низкий заряд" },
                { value: "normal", name: "нормальный заряд" }
            ]);
        }
        if (payload.battery !== undefined) {
            pushFloat(properties, payload.battery, "battery_level", "unit.percent", { min: 0, max: 100 });
        }
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_water_leak", id: deviceId, name: deviceName, capabilities: [], properties };
    }

    // ДАТЧИК ВИБРАЦИИ
    else if (payload.vibration !== undefined) {
        deviceType = "vibration";
        deviceId = `vibration-${baseId}`;
        const properties = [];
        let deviceName = "Датчик вибрации";
        const vibrationValue = payload.vibration ? "vibration" : "tilt";
        pushEvent(properties, "vibration", vibrationValue, [
            { value: "vibration", name: "вибрация обнаружена" },
            { value: "tilt", name: "вибрации нет" }
        ]);
        if (payload.battery !== undefined) {
            pushFloat(properties, payload.battery, "battery", "unit.percent", { min: 0, max: 100 });
        }
        if (payload.voltage !== undefined) {
            pushFloat(properties, payload.voltage, "voltage", "unit.volt");
        }
        if (payload.sensitivity !== undefined) {
            pushFloat(properties, payload.sensitivity, "sensitivity", null, { min: 0, max: 50 }, true);
        }
        actionMsg = { type: "zigbeeDeviceChanged", deviceId, capabilities: [], properties };
        if (isNewDevice) deviceInfo = { type: "sensor_vibration", id: deviceId, name: deviceName, capabilities: [], properties };
    }

    if (!deviceId) return outputs;
    outputs[0] = actionMsg ? { payload: [actionMsg] } : null;
    if (isNewDevice && deviceInfo) {
        registeredDevices.add(baseId);
        outputs[1] = { payload: [{ type: "searchZigbeeDevicesResult", devices: [deviceInfo] }] };
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

    // Анализируем exposes для определения типа устройства
    const hasSmoke = definition.exposes.some(e => e.name === 'smoke');
    const hasTemperature = definition.exposes.some(e => e.name === 'temperature');
    const hasHumidity = definition.exposes.some(e => e.name === 'humidity');
    const hasOccupancy = definition.exposes.some(e => e.name === 'occupancy');
    const hasAction = definition.exposes.some(e => e.name === 'action');
    const hasContact = definition.exposes.some(e => e.name === 'contact');
    const hasWaterLeak = definition.exposes.some(e => e.name === 'water_leak');
    const hasVibration = definition.exposes.some(e => e.name === 'vibration');

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
            state: { instance: "vibration", value: "tilt" },
            parameters: {
                instance: "vibration",
                events: [
                    { value: "vibration", name: "вибрация обнаружена" },
                    { value: "tilt", name: "вибрации нет" }
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
    } else if (hasContact) {
        deviceType = "sensor_contact";
        deviceName = "Датчик открытия";

        // Событие контакта
        properties.push({
            type: "event",
            state: { instance: "contact", value: "closed" },
            parameters: {
                instance: "contact",
                events: [
                    { value: "open", name: "открыто" },
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
    } else if (hasAction) {
        deviceType = "switch";
        deviceName = "Выключатель Zigbee";

        capabilities.push({
            type: "on_off",
            state: { instance: "on", value: false },
            parameters: { instance: "on_off", split: false }
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