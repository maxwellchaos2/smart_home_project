# Client Modules and Features Map

Документ описывает роль пакетов в `client/packages` и как они участвуют в runtime приложения.

## 1. Core и инфраструктура

- `common` — общие утилиты, базовые абстракции, DI/архитектурные primitives.
- `navigator` — навигационные компоненты и controller (используются через `AppNavigatorController`).
- `themes` — темы приложения и UI-конфигурация.
- `assets` — asset scope и доступ к ресурсам.
- `localization` — локализация и делегаты.
- `app_info` — сведения о приложении/версии и связанный scope.

## 2. Auth и пользователь

- `auth_token` — хранение/обновление auth token, auth-состояние.
- `auth` — экраны и логика входа.
- `users` — данные профиля пользователя (`/api/users/me`, создание пользователей).
- `projects` — выбор/загрузка проектов, связка с project context.

## 3. Устройства и доменная модель дома

- `devices` — базовая работа с устройствами.
- `rooms` — комнаты.
- `floors` — этажи.
- `device_positions` — позиционирование устройств на плане.

## 4. Сценарии и автоматика

- `inout_scenarios` — сценарии вход/выход.
- `device_scenarios` — сценарии по состояниям устройств/событиям.

## 5. Интеграции устройств и сервисов

- `zigbee_devices` — интеграция Zigbee устройств в UI/потоки клиента.
- `wifi_devices` — интеграция WiFi устройств.
- `yandex_auth` — авторизация Yandex.
- `hikvision_isapi` — интеграция Hikvision API.
- `events` — обработка доменных событий и реактивные обновления.

## 6. Runtime инициализация модулей

Модули поднимаются в `AppRunner.preloadData()`.

Последовательность важна:
1. Регистрация `IAppConfig`.
2. Инициализация `Dio`.
3. Инициализация инфраструктурных модулей.
4. Инициализация feature-модулей через `Future.wait`.

## 7. Scope-механика в UI

### Глобальные scope'ы
Поднимаются в `AppBuilder` (`_MainApp`):
- `AuthTokenScope`
- `LocalizationScope`
- `UserScope`
- `ProjectScope`
- `DevicePositionsScope`

### Проектные scope'ы
Поднимаются динамически при наличии `projectId` (`_ProjectScopesWrapper`):
- `DevicesScope`
- `RoomsScope`
- `FloorsScope`
- `DeviceScenariosScope`
- `InOutScenariosScope`

## 8. Практика расширения клиента

При добавлении новой фичи:
1. Создать пакет в `client/packages` или расширить существующий.
2. Подключить пакет в `client/pubspec.yaml`.
3. Инициализировать модуль в `AppRunner.preloadData()`.
4. Добавить scope/provider в `AppBuilder` при необходимости.
5. Зарегистрировать route в `getNavigatorController()` для экранов.
6. Обновить docs (`MODULES_AND_FEATURES.md`, `ARCHITECTURE.md`, `ROUTES` при наличии).
