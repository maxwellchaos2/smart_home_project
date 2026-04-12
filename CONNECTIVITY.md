# Связность проекта Smart Home

## Общая архитектура

Проект представляет собой **монорепозиторий** с двумя основными контурами:

### 1. Cloud/Backend контур
- **server** — центральный backend (Dart/Shelf), API и WebSocket
- **client** — Flutter-приложение для мобильных устройств

### 2. Edge/Local контур
- **local_service** — инфраструктурная папка для развертывания на Raspberry Pi/Ubuntu
- **sync_service** — локальный шлюз синхронизации с платформой
- **zigbee_service** — интеграция Zigbee устройств через MQTT
- **voice_assistant_service** — голосовой ассистент (Vosk + RHVoice)
- **scenarios_service** — выполнение сценариев автоматизации
- **logo_controller_service** / **logo_siemens_service** — интеграция с Siemens LOGO
- **hikvision_controller_service** — интеграция с Hikvision

## Общий слой (shared_packages)

### Структура
```
shared_packages/
├── common/          # Базовые типы и утилиты
├── devices_entities/ # DTO устройств
├── rooms_entities/  # DTO комнат
├── events/          # Модели событий и контракты
├── devices/         # Доменная логика устройств
└── rooms/           # Доменная логика комнат
```

### Граф зависимостей
```
common
├── devices_entities
├── rooms_entities
├── events (зависит от devices_entities, rooms_entities)
├── devices (зависит от events, devices_entities)
└── rooms (зависит от events, devices_entities, rooms_entities)
```

### Использование в проекте
- **client** и **server**: локальные пути (`path: packages/...`)
- **Edge-сервисы**: внешняя зависимость из GitHub (`https://github.com/Zotov-Dev/smart_home-shared_packages.git`)

## Связи между компонентами

### Cloud контур
```
client ←→ server (HTTP API + WebSocket)
```

- **client** отправляет команды и получает состояния через REST API и WebSocket
- **server** предоставляет 48 маршрутов (HTTP + WebSocket upgrade)
- Общие модели из `shared_packages`

### Edge контур (local_service)
```
sync_service ←→ [все edge-сервисы]
zigbee_service ←→ mqtt ←→ zigbee2mqtt
voice_assistant_service ←→ vosk-server, rhvoice-server
```

#### Ключевые зависимости
- **sync_service**: центр синхронизации, все сервисы подключаются через `SYNC_SERVICE_URL`
- **zigbee_service**: зависит от `mqtt` и `zigbee2mqtt` для Zigbee устройств
- **voice_assistant_service**: зависит от `vosk-server` (STT) и `rhvoice-server` (TTS)
- **scenarios_service, logo_controller_service, hikvision_controller_service**: зависят от `sync_service`

### Связь контуров
```
server ←→ sync_service (HTTP API)
```

- **server** синхронизирует состояние с edge-контуром через `sync_service`
- **sync_service** маршрутизирует события между edge-сервисами и платформой

## Развертывание

### Cloud контур
- **server**: Docker Compose (production) или debug-режим для разработки
- **client**: Flutter-приложение, конфигурация через `--dart-define-from-file`

### Edge контур
- **local_service**: единый `docker compose up -d` на Raspberry Pi
- Все сервисы в одной сети (`app-network`)
- Общие volume: `~/smart_home/...` для конфигурации и данных

## Степень связности

### Высокая связность
- Все компоненты используют единые модели из `shared_packages`
- Edge-сервисы жестко зависят от `sync_service`
- `local_service` объединяет все edge-компоненты в один compose

### Низкая связность
- Cloud и edge контуры разделены (server ↔ sync_service)
- Edge-сервисы могут работать независимо (кроме зависимости от sync_service)
- `shared_packages` — независимый слой без обратных зависимостей

### Рекомендации по разделению
Текущая структура монорепозитория **оправдана**:
- Единые контракты в `shared_packages`
- Совместная разработка cloud + edge
- Простота развертывания edge-контура

Разделение на отдельные репозитории может быть полезно при:
- Независимом релизе компонентов
- Разных командах разработки
- Масштабном росте проекта

## Переменные окружения

### Общие
- `ENV` — окружение (dev/prod)

### Cloud
- `REMOTE_SERVER_URL` — URL backend для sync_service

### Edge
- `SYNC_SERVICE_URL` — URL sync_service (обычно `http://sync_service:8080`)
- `ZIGBEE_BROKER`, `ZIGBEE_PORT` — MQTT для zigbee_service
- `VOSK_URL`, `RHVOICE_URL` — URL серверов распознавания для voice_assistant_service
- `HIKVISION_IP`, `HIKVISION_USER`, `HIKVISION_PASSWORD` — доступ к Hikvision
- `LOGO_CONTROLLER_IP` — IP Siemens LOGO

## Мониторинг и логи
- Все сервисы логируют в stdout/stderr
- Docker Compose: `docker compose logs -f [service_name]`
- Ключевые сервисы для проверки: `sync_service`, `zigbee_service`, `zigbee2mqtt`, `voice_assistant_service`