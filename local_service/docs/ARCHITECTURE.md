# Local Service Architecture

## 1. Архитектурная роль
`local_service` — точка сборки edge-инсталляции в одном `docker compose`.

Он объединяет:
- edge-сервисы платформы;
- транспорт и адаптеры локальных устройств;
- системные компоненты распознавания/озвучивания;
- эксплуатационные механизмы обновления.

## 2. Основные группы контейнеров

### 2.1 Edge-сервисы платформы
- `sync_service` — локальный шлюз в платформу и центр синхронизации.
- `zigbee_service` — интеграция Zigbee устройств через MQTT.
- `scenarios_service` — выполнение сценариев.
- `voice_assistant_service` — голосовые команды и управление.
- `logo_controller_service`, `hikvision_controller_service` — интеграции с контроллерами/камерой.

### 2.2 Инфраструктура
- `mqtt` (`eclipse-mosquitto`) — брокер сообщений.
- `zigbee2mqtt` — мост Zigbee ↔ MQTT.
- `vosk-server` — STT.
- `rhvoice-server` — TTS.
- `watchtower` — автообновление образов.

## 3. Ключевые связи
- `zigbee2mqtt` публикует события в `mqtt`, а `zigbee_service` их обрабатывает.
- Большинство edge-сервисов опираются на `sync_service` для обмена с платформой.
- `voice_assistant_service` зависит от `vosk-server` и `rhvoice-server`.

## 4. Требования к хосту
- Доступ к устройствам: USB Zigbee-адаптер, звук, bluetooth/usb-шина.
- Валидные host volumes в формате `~/smart_home/...`.
- Единая сеть compose (`app-network`) для внутренних сервисных URL.
