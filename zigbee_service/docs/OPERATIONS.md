# Zigbee Service Operations

## 1. Запуск
- Убедиться, что в compose подняты `mqtt`, `zigbee2mqtt`, `sync_service`.
- Создать `.env` из шаблона.
- Проверить `ZIGBEE_BROKER`, `ZIGBEE_PORT`, `SYNC_SERVICE_URL`.

```bash
cp .env.example .env
```

Локальный запуск (debug):

```bash
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

Сборка Docker image:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t zigbee_service:latest .
```