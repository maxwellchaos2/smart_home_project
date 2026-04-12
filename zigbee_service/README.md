# zigbee_service

Локальный Zigbee интеграционный сервис, работающий на Raspberry Pi в общем Docker Compose с `sync_service`, `mqtt` и `zigbee2mqtt`.

## Важное требование
`zigbee2mqtt` должен быть поднят в том же Docker Compose, иначе `zigbee_service` не получит Zigbee события и не сможет отправлять команды в сеть.

## Основные зависимости
- `SYNC_SERVICE_URL` — синхронизация с платформой через `sync_service`.
- `ZIGBEE_BROKER` — MQTT broker (обычно `mqtt` в compose).
- `ZIGBEE_PORT` — MQTT порт (обычно `1883`).

## Быстрый запуск

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
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t zigbee_service:latest .
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`
- `docs/DEPLOY_LOCAL_SERVER.md`