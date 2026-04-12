# Shared Packages Architecture

## 1. Назначение слоя
`shared_packages` — независимый от конкретных сервисов слой контрактов и доменных библиотек.

Его задача — обеспечить одинаковое понимание моделей и событий между клиентом, server и edge-сервисами на Raspberry Pi.

## 2. Фактическая структура пакетов
- `common` — нижний уровень (базовые сущности, утилиты, shared types).
- `devices_entities` → зависит от `common`.
- `rooms_entities` → зависит от `common`.
- `events` → зависит от `common`, `devices_entities`, `rooms_entities`.
- `devices` → зависит от `common`, `events`, `devices_entities`.
- `rooms` → зависит от `common`, `events`, `devices_entities`, `rooms_entities`.

## 3. Правила архитектуры
- Запрещены зависимости shared-пакетов от конкретных приложений/сервисов.
- Изменения в `events` и entity-пакетах считаются контрактными и должны быть backward-compatible по умолчанию.
- Любой breaking change требует coordinated update потребителей.

