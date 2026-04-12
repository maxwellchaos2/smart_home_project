# Logo Siemens Architecture

## 1. Основные блоки
- **Ingress Adapter**: принимает команды из платформы.
- **Siemens Protocol Layer**: реализует обмен с Siemens LOGO.
- **Domain Mapper**: переводит low-level поля в доменную модель.
- **Egress Publisher**: отправляет обновления во внутреннюю шину.

## 2. Фактические runtime-компоненты
- `LogoSiemensController` (`lib/src/logo_siemens_controller.dart`):
	- подключение к MQTT брокеру;
	- подписка на `logo/events`;
	- публикация команд в `logo/commands`;
	- поток `changedStateStream`.
- `IEventsRepository`:
	- принимает `needDeviceCapabilitiesChange` из sync;
	- отправляет `deviceCapabilitiesChanged` в sync.
- `IDevicesController`:
	- хранит/обновляет устройства и связывает `providerDeviceId` с внешними state IDs.
- `InOutScenarioExecutorService`:
	- исполняет продуктовые сценарии и переводит `changeDevice` действия в вызов `updateState`.
- `DeviceStateChangeHandler`:
	- обрабатывает входящие изменения состояния для доменной синхронизации.

## 3. Принципы проектирования
- Явная граница между протоколом и доменной моделью.
- Минимизация связности с внешними сервисами.
- Идемпотентность обработки повторных событий.

Дополнительно:
- Продуктовая адаптивность: state IDs не зафиксированы жёстко как `Q1..Q8`, а приходят из внешней модели.
- Событийная модель: изменения состояния приходят через MQTT `reported state`, а команды уходят через MQTT `commands`.

## 4. Поток команд (Smart Home -> LOGO)
1. Приходит `needDeviceCapabilitiesChange` или действие сценария `changeDevice`.
2. Находится устройство `providerType=logoSiemens` и его `providerDeviceId`.
3. Формируется целевое состояние `[1]` или `[0]`.
4. Вызывается `LogoSiemensController.updateState(stateId, value)`.
5. Команда публикуется в MQTT топик `logo/commands`.

## 5. Поток событий (LOGO -> Smart Home)
1. MQTT сообщение приходит в `logo/events`.
2. Контроллер парсит `state.reported` и формирует `LogoSiemensStateChange`.
3. По `state.id` находится соответствующее устройство.
4. Сервис отправляет `deviceCapabilitiesChanged(on_off)` в sync.

## 6. Точки контроля
- Валидация payload до отправки в контроллер.
- Таймауты и retry-политики на сетевом уровне.
- Метрики надежности по каждому типу операции.

## 7. Особенности для коммерческого контура
- Логика поведения задаётся комбинацией сценариев и входящих команд, что позволяет адаптировать интеграцию под разные объекты без перепрошивки жесткой схемы.
- MQTT слой облегчает интеграцию с внешними gateway/bridge компонентами на объекте.
