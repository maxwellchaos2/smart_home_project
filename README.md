# smart_home

Монорепозиторий платформы Smart Home: мобильный/desktop клиент, backend, edge-сервисы для Raspberry Pi и общий слой доменных пакетов.

## Общая идея

Проект разделён на два контура:
- **Cloud/Backend контур** — `server` и связанные backend-пакеты.
- **Edge/Local контур** — сервисы, которые запускаются рядом с устройствами (обычно на Raspberry Pi), и объединяются в один `docker compose` через `local_service`.

Клиент (`client`) работает с backend и управляет устройствами, а edge-сервисы обеспечивают интеграцию с локальным железом и протоколами.

## Структура репозитория

### Основные приложения
- `client` — Flutter-клиент Smart Home.
- `server` — backend API и серверные пакеты.

### Edge-сервисы (локальный запуск)
- `sync_service` — локальный шлюз/синхронизация с платформой.
- `zigbee_service` — интеграция Zigbee устройств через MQTT/Zigbee2MQTT.
- `voice_assistant_service` — голосовой контур (Vosk + RHVoice).
- `scenarios_service` — выполнение сценариев автоматизации.
- `logo_controller_service` / `logo_siemens_service` — интеграция с контроллерами Siemens LOGO.
- `hikvision_controller_service` — интеграция с Hikvision.

### Общие библиотеки
- `shared_packages` — единый слой моделей/контрактов и доменных пакетов, используемый разными сервисами.

### Инфраструктурный слой локального контура
- `local_service` — папка, которую переносят на сервер и запускают как единый `docker compose` для edge-инсталляции.

## Как это запускается на объекте

Базовый сценарий для Raspberry Pi/локального сервера:
1. Подготовить/обновить образы сервисов.
2. Перенести папку `local_service` на сервер.
3. Настроить `.env` и host-пути для volume.
4. Выполнить `docker compose up -d` из `local_service`.
5. Проверить логи ключевых контейнеров (`sync_service`, `zigbee_service`, `zigbee2mqtt`, `voice_assistant_service`).

Подробный runbook: `local_service/docs/DEPLOY_LOCAL_SERVER.md`.

## Короткая схема взаимодействия

1. `client` отправляет команды и запросы в `server`.
2. `server` синхронизирует состояние с edge-контуром через `sync_service`.
3. `sync_service` маршрутизирует локальные события и команды между edge-сервисами.
4. `zigbee_service` работает через `mqtt` + `zigbee2mqtt` для управления Zigbee-устройствами.
5. `scenarios_service` и контроллеры (`logo_*`, `hikvision_*`) выполняют автоматизацию и интеграции.
6. `voice_assistant_service` использует `vosk-server` (STT) и `rhvoice-server` (TTS).
7. Общие модели/контракты для всех контуров берутся из `shared_packages`.

## Документация по сервисам

В каждом сервисе есть `docs/` с практическими материалами:
- обзор и зона ответственности;
- архитектура и связи;
- деплой (для сервисов, где это требуется).