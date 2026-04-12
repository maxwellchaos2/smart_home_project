# Client Architecture

## 1. Логические слои
- **Presentation layer**: экраны, виджеты, навигация, локальные состояния UI.
- **Application layer**: use-cases, orchestration действий пользователя.
- **Domain layer**: модели предметной области (устройства, комнаты, сценарии, события).
- **Data layer**: API-клиенты, локальные хранилища, DTO/мапперы, репозитории.

## 2. Точка входа и bootstrap

### `lib/main.dart`
- Приложение запускается в `runZonedGuarded`.
- Значение `ENV` читается из `const String.fromEnvironment('ENV')`.
- По `ENV` выбирается `DevAppConfig` или `ProdAppConfig`.
- Создаются `AppRunner` и `AppBuilder`, затем вызывается `runner.run(builder)`.

### `lib/src/main_app_runner.dart`
- Создаётся/регистрируется `GetIt` контейнер.
- Инициализируется `Dio` с `baseUrl = appConfig.apiUrl`.
- Подключается `LogInterceptor` и custom `DioTransformer`.
- Инициализируются feature modules:
	- auth/auth_token, users, projects
	- devices/rooms/floors
	- events, scenarios
	- yandex/zigbee/wifi/hikvision
	- device_positions и др.

### `lib/src/app_builder.dart`
- Создаётся корневой `MaterialApp`.
- Подключаются scope/provider слои.
- Навигатор строится через `AppNavigatorController`.
- Для проектно-зависимых данных создаётся `_ProjectScopesWrapper`, который поднимает domain scopes только при наличии `projectId`.

## 3. Потоки данных
1. UI-слой инициирует пользовательское действие.
2. Application-слой вызывает use-case.
3. Use-case обращается к repository.
4. Repository использует remote/local source.
5. Результат возвращается в UI с нормализованным состоянием (loading/success/error).

## 4. Навигация и маршруты
- Регистрация маршрутов выполняется в `getNavigatorController()` (`lib/main.dart`).
- Базовые маршруты:
	- `/splash`
	- `/sign_in`
	- `/main`
	- `/rooms`
	- `/inout_scenarios`
	- `/device_scenarios`
	- `/controller_devices`
	- `/add_controller_device`
	- `/add_yandex_devices`
	- `/add_zigbee_devices`
	- `/add_wifi_devices`
- Изменение root-stack выполняется через `navigatorController.change(...)`.

## 5. Конфигурация окружения
- `ProdAppConfig`:
	- `baseUrl = https://api.smart-home-pnz.ru/`
	- `apiUrl = {baseUrl}api/`
	- `wsUrl = wss://api.smart-home-pnz.ru/ws`
- `DevAppConfig`:
	- `baseUrl = http://localhost:8080/`
	- `apiUrl = {baseUrl}api/`
	- `wsUrl = ws://localhost:8080/ws`
- Выбор окружения происходит через `--dart-define-from-file=config/*.json`.

## 6. Обработка ошибок
- Сетевые ошибки переводятся в пользовательские статусы с ретраем.
- Ошибки валидации отображаются до отправки на сервер.
- Критические ошибки логируются и сопровождаются fallback-экраном.

## 7. Состояние и DI
- DI-контейнер: `GetIt`.
- Глобальные scope'ы и провайдеры поднимаются в `AppBuilder`.
- Feature scopes активируются модульно, чтобы не грузить лишние домены до выбора проекта.

## 8. Безопасность
- Токены и секреты хранятся в безопасном хранилище платформы.
- Исключается хранение секретов в исходниках и коммитах.
- При истечении сессии выполняется принудительный re-auth flow.

## 9. Архитектурные решения
- Единый механизм сериализации/десериализации API-контрактов.
- Централизованный HTTP/interceptor слой для авторизации и трассировки.
- Детерминированные состояния экранов для предсказуемого UX.

## 10. Где смотреть детали модулей
- Распределение ответственности по пакетам: `docs/MODULES_AND_FEATURES.md`.
- Практика запуска и отладки: `docs/LOCAL_SETUP_AND_DEBUG.md`.
