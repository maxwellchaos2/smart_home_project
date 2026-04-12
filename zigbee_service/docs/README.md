# Zigbee Service Documentation

## 1. Назначение
`zigbee_service` интегрирует Zigbee-устройства в Smart Home через связку MQTT + Zigbee2MQTT.

Практический контур:
- сервис запускается на Raspberry Pi;
- работает в одном Docker Compose с `sync_service`;
- получает данные из `zigbee2mqtt` через MQTT broker;
- отправляет состояния/события и команды в платформу через `sync_service`.

## 2. Ответственность
- Подключение к MQTT broker (`ZIGBEE_BROKER:ZIGBEE_PORT`).
- Подписка на топики Zigbee2MQTT (`zigbee2mqtt/#`).
- Нормализация Zigbee payload в доменные capabilities/properties устройства.
- Создание новых Zigbee устройств в платформе (`newZigbeeDevice`).
- Преобразование `needDeviceCapabilitiesChange` в команды `zigbee2mqtt/<device>/set`.
- Управление режимом join (`permitJoinZigbeeDevices`).

## 3. Структура документации
- `docs/README.md` — обзор Zigbee-контура.
- `docs/ARCHITECTURE.md` — архитектура и потоки MQTT/Zigbee.
- `docs/OPERATIONS.md` — запуск, мониторинг и troubleshooting.
- `docs/DEPLOY_LOCAL_SERVER.md` — деплой на Ubuntu 20+/Raspberry Pi.

## 4. Обязательные зависимости в compose
- `sync_service` — обязателен (events/devices API).
- `zigbee2mqtt` — обязателен (источник Zigbee данных/команд).
- `mqtt` (mosquitto) — обязателен, transport между `zigbee_service` и `zigbee2mqtt`.

Важно: `zigbee2mqtt` должен быть поднят в том же Docker Compose.

## 5. Переменные окружения
- `SYNC_SERVICE_URL` (обычно `http://sync_service:8080`)
- `ZIGBEE_BROKER` (обычно `mqtt` внутри compose)
- `ZIGBEE_PORT` (обычно `1883`)

