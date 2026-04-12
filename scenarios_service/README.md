# scenarios_service

Локальный сервис исполнения сценариев Smart Home, запускаемый на малинке в одном Docker Compose с `sync_service` и остальными edge-сервисами.

## Что делает сервис
- Подписывается на события через `sync_service`.
- Анализирует условия сценариев (`device_scenarios` и `inout_scenarios`).
- Выполняет actions (`changeDeviceState`, `delay`, и др.).
- Отправляет команды изменения состояния устройств обратно в events pipeline.

## Ключевая зависимость
- `SYNC_SERVICE_URL` — адрес `sync_service` (обычно `http://sync_service:8080`).

## Локальный запуск

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
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t scenarios_service:latest .
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`
- `docs/DEPLOY_LOCAL_SERVER.md`
