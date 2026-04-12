# Shared Packages Documentation

## 1. Назначение
`shared_packages` — общее ядро доменных пакетов, которые используют backend и edge-сервисы Smart Home.

Для контекста Raspberry Pi: сервисы, запускаемые в одном Docker Compose, опираются на единые типы и event-контракты из этого каталога.

## 4. Карта документации
- `docs/README.md` — обзор роли shared-слоя.
- `docs/ARCHITECTURE.md` — реальный граф пакетов и правила изменений.
- `docs/OPERATIONS.md` — практический workflow разработки и совместимости.
