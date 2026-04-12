# client

`client` — Flutter-приложение платформы Smart Home.

Отвечает за пользовательский интерфейс, авторизацию, отображение состояния устройств/комнат/сценариев и отправку команд в backend.

## Что внутри
- `lib/` — точки входа, UI и orchestration приложения.
- `packages/` — модульные фичи клиента (`devices`, `rooms`, `events`, `auth` и др.).
- `config/dev.json`, `config/prod.json` — окружения через `--dart-define-from-file`.
- `docs/` — практическая документация по запуску, конфигурации и архитектуре.

## Быстрый локальный запуск

```bash
cd client
flutter pub get
flutter run --dart-define-from-file=config/dev.json
```

Для запуска через VS Code используйте конфигурации из `.vscode/launch.json` (например `run dev`).

## Важный момент по API
- В `dev` по умолчанию используется `http://localhost:8080/api/` и `ws://localhost:8080/ws`.
- Для физического устройства `localhost` — это само устройство, а не ваш компьютер; при необходимости укажите доступный IP/hostname backend.

## Документация
- `docs/README.md`
- `docs/LOCAL_SETUP_AND_DEBUG.md`
- `docs/CONFIGURATION.md`
- `docs/ARCHITECTURE.md`
- `docs/MODULES_AND_FEATURES.md`
- `docs/OPERATIONS.md`
