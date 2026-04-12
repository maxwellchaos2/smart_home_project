# Client Operations Guide

См. подробный runbook локального запуска: `docs/LOCAL_SETUP_AND_DEBUG.md`.

## 1. Базовый локальный запуск
1. Перейти в `client`.
2. Выполнить `flutter pub get`.
3. Запустить приложение:
	- через VS Code launch profile, либо
	- через CLI `flutter run --dart-define-from-file=config/dev.json`.

## 2. Сборка

### Через Makefile (проектный путь)
- `make build_apk`
- `make build_prod_android`
- `make build_prod_ios`
- `make build_prod`

Команды Makefile используют `fvm flutter` и `config/prod.json`.

### Через Flutter CLI
- Android APK: `flutter build apk --dart-define-from-file=config/prod.json`
- Android AAB: `flutter build appbundle --dart-define-from-file=config/prod.json`
- iOS: `flutter build ios --dart-define-from-file=config/prod.json`
- macOS: `flutter build macos --dart-define-from-file=config/prod.json`

## 3. Проверки качества
- Статика: `flutter analyze`.
- Тесты: `flutter test`.
- Интеграционные тесты: `flutter test integration_test`.
- Дополнительно: ручной smoke критичных сценариев.

## 4. Диагностика
- Белый экран/падение на старте: проверить инициализацию и доступность API.
- Проблемы авторизации: проверить токен, clock skew, endpoint и сертификаты.
- Неверные статусы устройств: проверить корректность подписки на события.
- Ошибки dev-сервера: проверить соответствие `config/dev.json` и доступность backend на localhost.

## 5. Релизный чеклист
- Обновлены номера версий и changelog.
- Проверены ключевые сценарии: login, список устройств, отправка команд, сценарии.
- Проверена обратная совместимость с текущими backend-контрактами.
- Подготовлен план отката и мониторинг после публикации.

## 6. Генерация локализации
- macOS/Linux: `make l10n_generate`
- Windows: `make l10n_generate_win`

## 7. Ссылки
- Конфигурация окружений: `docs/CONFIGURATION.md`
- Карта модулей: `docs/MODULES_AND_FEATURES.md`

