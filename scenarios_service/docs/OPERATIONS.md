# Scenarios Service Operations

## 1. Запуск
- Создать `.env` из шаблона.
- Убедиться, что `SYNC_SERVICE_URL` указывает на `sync_service` внутри compose.
- Запустить сервис (обычно через Docker Compose, локально — через Dart).

Пример env:

```bash
cp .env.example .env
```

Локальный запуск Dart:

```bash
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

Сборка Docker:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t scenarios_service:latest .
```



