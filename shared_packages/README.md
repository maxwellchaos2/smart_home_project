# shared_packages

Общий слой Dart-пакетов для всей платформы Smart Home.

Ключевая роль: единые модели, контракты и event-типизация для сервисов, которые крутятся на Raspberry Pi в локальном Docker Compose (`sync_service`, `zigbee_service`, `scenarios_service`, `voice_assistant_service`, `logo_*`, `hikvision_*`).

## Что внутри
- `common` — базовые типы, утилиты, shared primitives.
- `devices_entities` — DTO/сущности устройств.
- `rooms_entities` — DTO/сущности комнат.
- `events` — event-модели и контракты обмена событиями.
- `devices` — доменная логика устройств поверх `events` + `devices_entities`.
- `rooms` — доменная логика комнат поверх `events` + entities.

## Фактический граф зависимостей
```text
common
├── devices_entities
├── rooms_entities
├── events (также зависит от devices_entities, rooms_entities)
├── devices (также зависит от events, devices_entities)
└── rooms (также зависит от events, devices_entities, rooms_entities)
```

## Почему это важно для сервисов на малинке
- Локальные сервисы не должны расходиться в контрактах событий/сущностей.
- Изменения в shared-пакетах напрямую влияют на обработку событий и команд между edge-сервисами и `sync_service`.
- Один источник истины для сериализации/десериализации снижает ошибки интеграции в проде.

## Быстрый workflow изменения shared-пакета
```bash
# пример: меняем events
cd shared_packages/events
dart pub get
dart run build_runner build --delete-conflicting-outputs
dart analyze
dart test
```

После изменений нужно обновить зависимые сервисы/приложения и перепроверить их сборку.

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`