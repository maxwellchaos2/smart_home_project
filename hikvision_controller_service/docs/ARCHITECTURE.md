# Hikvision Controller Architecture

## 1. Компоненты
- **Command Consumer**: получает команды из внутреннего транспорта.
- **Protocol Adapter**: адаптирует команды к API/протоколу Hikvision.
- **State Normalizer**: приводит ответы к внутреннему доменному формату.
- **Event Publisher**: публикует события о результате операций.

## 2. Фактические runtime-компоненты в коде
- `IEventsRepository` — входящий поток команд и исходящая отправка событий в sync контур.
- `IDevicesController` / `ICreateDeviceController` — загрузка и автосоздание устройства Hikvision в платформе.
- `IISAPIClient` — канал событий и команд к терминалу Hikvision.
- `IOpenDoorController` / `ICloseDoorController` — операции на замок.
- Таймер heartbeat — периодическое событие жизнеспособности устройства.

## 3. Поток обработки команд (Smart Home -> Hikvision)
1. Входящее сообщение валидируется и трассируется.
2. Проверяется, что событие относится к целевому устройству Hikvision (`providerType=hikvision`, `providerDeviceId=HIKVISION_IP`).
3. Для `needDeviceCapabilitiesChange` и `on_off=true` вызывается open-door команда.
4. Для `needDeviceCapabilitiesChange` и `on_off=false` вызывается close-door команда.
5. Результат отражается в состоянии устройства через стандартные события платформы.

## 4. Поток событий (Hikvision -> Smart Home)
1. Сервис держит подписку на ISAPI alert stream.
2. Получает `AccessControllerEvent`.
3. По `subEventType` маппит состояние:
	- 21/22 -> capability `on_off`.
	- 26/27 -> property `event.open` (`opened/closed`).
4. Передаёт изменения в `devicesController.devicesCapabilitiesChanged` / `devicesController.devicesPropertiesChanged`.

## 5. Автосоздание устройства
- На старте сервис проверяет наличие устройства Hikvision в проекте `projectId = -1`.
- Если устройства нет, создаёт `doorWithLock` с базовыми capabilities/properties.
- После успешного создания повторно запрашивает список устройств.

## 6. Heartbeat стратегия
- Сразу после старта отправляется `onDeviceHeartbeat`.
- Далее heartbeat отправляется каждые 10 секунд.
- Это позволяет upstream-сервисам помечать устройство как online/offline.

## 7. Надежность
- Повторный `fetch()` устройств при ошибке (задержка 5 секунд).
- Автопереподключение в ISAPI event stream клиенте.
- Повторная попытка create-device при failure состояния контроллера.

## 8. Наблюдаемость
- Структурированные логи с trace/correlation идентификаторами.
- Метрики задержки внешних вызовов и частоты ошибок.
- Точки контроля для входного и выходного трафика.
