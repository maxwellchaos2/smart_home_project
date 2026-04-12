# voice_assistant_service

Локальный голосовой ассистент Smart Home, который работает на Raspberry Pi в одном Docker Compose с `sync_service`, `vosk-server` и `rhvoice-server`.

## Важное требование
`vosk-server` должен быть поднят в общем Docker Compose, иначе распознавание речи не будет работать.

## Основные зависимости
- `SYNC_SERVICE_URL` — доступ к событиям/устройствам через `sync_service`.
- `VOSK_URL` — WebSocket endpoint распознавания (обычно `ws://vosk-server:2700`).
- `RHVOICE_URL` — HTTP endpoint озвучки (обычно `http://rhvoice-server:2800`).
- `AUDIO_ID` — опциональный id ALSA устройства (если не задан, сервис пытается определить автоматически).

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
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t voice_assistant_service:latest .
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`
- `docs/DEPLOY_LOCAL_SERVER.md`

