# Scenarios Service Architecture

## 1. Роль в локальном контуре
`scenarios_service` является локальным движком сценариев и работает через `sync_service` как единый канал событий/команд.

## 2. Основные компоненты
- **EventsModule**
	- подключение к WebSocket/событийному потоку `sync_service`;
	- получение событий устройства и системных команд сценариев.
- **DevicesModule**
	- загрузка списка устройств проекта (`projectId=-1` на стороне клиента, подстановка выполняется `sync_service`).
- **DeviceScenariosModule**
	- обработка device-сценариев;
	- `DeviceStateChangeHandler` проверяет условия и запускает `DeviceScenarioExecutorService`.
- **InOutScenariosModule**
	- обработка in/out сценариев и действий `changeOutput`/`delay`.

## 3. Поток обработки событий
1. Сервис получает событие из `sync_service`.
2. Для `deviceStateChanged` вызывается `DeviceStateChangeHandler`.
3. Релевантные сценарии выбираются по condition дереву (`and/or`, state, value, event).
4. Executor исполняет actions последовательно (включая `delay`).
5. Для действий `changeDeviceState` сервис отправляет `needDeviceCapabilitiesChange` обратно в events pipeline.

## 4. Поток запуска сценария по команде
1. Приходит `needRunDeviceScenario`.
2. Сценарий загружается из repository по `scenarioId`.
3. Если найден — исполняется executor; если нет — логируется ошибка `Device scenario not found`.

## 5. Важные ограничения
- Защита от циклических сценариев и лавинных запусков.
- Ограничение параллелизма для предсказуемой нагрузки.
- Гарантия идемпотентности при повторе событий.

## 6. Границы ответственности
- `scenarios_service` не хранит auth token удаленного API.
- Транспорт и авторизация до удаленного сервера выполняются `sync_service`.
- Управление контейнерами выполняется compose уровнем (`local_service/compose.yaml`).

