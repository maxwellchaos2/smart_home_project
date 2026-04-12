# Scenarios Service Documentation

## 1. Назначение
`scenarios_service` исполняет сценарии автоматизации в локальном контуре Smart Hub на малинке.

Практический контекст:
- сервис запускается в том же Docker Compose, что и `sync_service` и остальные локальные сервисы;
- получает события через `sync_service`;
- рассчитывает условия сценариев и инициирует действия;
- изменения устройств отправляет обратно через `sync_service`.

## 2. Ответственность
- Обработка событий `deviceStateChanged` и `needRunDeviceScenario`.
- Выполнение `device_scenarios` (действия над устройствами).
- Поддержка `inout_scenarios` (условия входов/выходов, delay/sequence).
- Генерация команд `needDeviceCapabilitiesChange` для фактического изменения состояния устройств.
- Работа как локальный автоматизационный движок без прямого доступа к удаленному API (через `sync_service`).

## 3. Документация
- `docs/README.md` — обзор и роль сервиса в локальном контуре.
- `docs/ARCHITECTURE.md` — runtime-потоки и компоненты сценарного движка.
- `docs/OPERATIONS.md` — запуск, диагностика и эксплуатация.
- `docs/DEPLOY_LOCAL_SERVER.md` — деплой на Ubuntu 20+/Raspberry Pi.

## 4. Переменные окружения
- `SYNC_SERVICE_URL` — адрес `sync_service` (обычно `http://sync_service:8080` в общем compose).

## 5. Бизнес-ценность
Сервис обеспечивает локальную автоматизацию даже при разделении ролей: сценарная логика живет в `scenarios_service`, а сетевой/авторизационный шлюз в `sync_service`.
