# Zigbee Service Architecture

## 1. Подсистемы
- **MQTT Connector (`ZigbeeMqttService`)**
	- подключение к `ZIGBEE_BROKER:ZIGBEE_PORT`;
	- подписка на `zigbee2mqtt/#`.
- **Device Discovery & Interview**
	- обработка bridge событий устройств;
	- создание новых устройств в платформе (`newZigbeeDevice`).
- **State Processor**
	- маппинг Zigbee payload в capabilities/properties;
	- отправка `deviceCapabilitiesChanged`/`devicePropertiesChanged`.
- **Command Pipeline**
	- при `needDeviceCapabilitiesChange` формируется payload и отправляется в `zigbee2mqtt/<friendlyName>/set`.

## 2. Поток событий
1. Zigbee устройство отправляет состояние в Zigbee2MQTT.
2. Zigbee2MQTT публикует MQTT сообщение в `zigbee2mqtt/<device>`.
3. `zigbee_service` читает сообщение, маппит в доменную модель.
4. Событие отправляется в platform events через `sync_service`.

## 3. Поток команд
1. От платформы приходит `needDeviceCapabilitiesChange`.
2. `zigbee_service` находит Zigbee устройство по `providerDeviceId`.
3. Формирует Zigbee payload через mapper.
4. Публикует в `zigbee2mqtt/<friendlyName>/set`.

## 4. Особенности Zigbee
- Учет sleep-режима батарейных устройств.
- Работа с delayed/dropped сообщениями.
- Контроль качества mesh-маршрутизации.

## 5. Сетевые зависимости в edge-контуре
- `zigbee_service -> sync_service` по `SYNC_SERVICE_URL`.
- `zigbee_service -> mqtt` по `ZIGBEE_BROKER:ZIGBEE_PORT`.
- `zigbee2mqtt -> mqtt` и доступ к Zigbee адаптеру (`/dev/ttyUSB*`).

Все сервисы должны быть в одном compose и одной сети (`app-network`).
