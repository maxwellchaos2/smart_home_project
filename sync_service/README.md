# sync_service

Центральный локальный сервис Smart Hub, который запускается на малинке и синхронизирует локальный контур с удаленным сервером.

## Роль в системе
- Находится в том же Docker Compose, что и остальные локальные сервисы.
- Проксирует API/WS запросы в удаленный backend.
- Подставляет токен авторизации устройства в исходящие запросы.
- Обрабатывает первичную настройку устройства через BLE (из Flutter приложения).

## Что приходит из Flutter приложения через BLE
- Wi‑Fi: `ssid`, `pass`.
- Авторизация/привязка: `authToken`, `deviceId`, `projectId`.

Эти данные сохраняются в `config_data/config.json`.

## Переменные окружения
- `REMOTE_SERVER_URL`
- `CONFIG_DATA_PATH` (default: `/app/config_data`)
- `PORTT` (default: `8080`)

## Быстрый запуск локально

```bash
cp .env.example .env
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

## Docker build

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t sync_service:latest .
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`
- `docs/DEPLOY_LOCAL_SERVER.md`
