# LOGO Controller Architecture

## 1. Компоненты
- **Input Poller/Subscriber**: читает фактические статусы входов/параметров.
- **Command Handler**: принимает команды от платформы.
- **Protocol Bridge**: инкапсулирует протокол взаимодействия с контроллером.
- **State Mapper**: преобразует low-level данные в доменные события.

## 2. Фактические runtime-компоненты в коде
- `LogoControllerService` (`lib/src/logo_controller_service.dart`):
	- `connect(plcIp, rack, slot, libraryPath)`;
	- `readOutputs()` для чтения `Q` выходов;
	- `writeNI()` для переключения состояния канала;
	- поток `outputChangeStream` для событий изменений.
- `IEventsRepository`: прием команд из sync и отправка изменений обратно.
- `IDevicesController`: доступ к устройствам и обновление их capabilities.

## 3. Поток команд (Smart Home -> LOGO)
1. Из `onEvents` приходит `needDeviceCapabilitiesChange`.
2. Находится устройство с `providerType=logoSiemens` и `providerDeviceId=Qn`.
3. Из capability извлекается `on_off` состояние.
4. Выполняется `writeNI(index, state)` в контроллер LOGO.
5. Состояние в контроллере физически меняется (свет включается/выключается).

## 4. Поток телеметрии (LOGO -> Smart Home)
1. Сервис циклически читает выходы LOGO (`readOutputs`) примерно каждые 100 мс.
2. Вычисляет изменения относительно последнего снимка.
3. Для изменившегося `Qn` публикует `deviceCapabilitiesChanged` с `on_off`.

## 5. Надежность и восстановление
- В `connect()` реализован бесконечный цикл переподключения при сбоях.
- При ошибке fetch устройств из sync выполняется повторная попытка через 5 секунд.
- Доступ к контроллеру сериализован через `Lock` (`synchronized`) для избежания гонок чтение/запись.

## 6. Heartbeat
- При каждом `tick` сервис контролирует интервал и раз в ~10 секунд отправляет `onDeviceHeartbeat` для устройств:
	- `controlBoxHub`
	- `logoSiemens` с `providerDeviceId` вида `Q*`
