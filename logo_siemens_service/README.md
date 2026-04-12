# logo_siemens_service

Сервис интеграции Siemens LOGO для продуктового контура умного дома.

Ключевая роль сервиса:
- получать изменения состояния через MQTT (`logo/events`);
- отправлять команды управления через MQTT (`logo/commands`);
- синхронизировать изменения с backend/sync сервисом.

## Отличие от `logo_controller_service`
- `logo_controller_service` чаще используется как более фиксированная (жесткая) логика под конкретный объект.
- `logo_siemens_service` ориентирован на повторно используемую, продаваемую логику: поведение задаётся событиями/сценариями и state IDs.

## Переменные окружения
Создайте `.env` на основе шаблона:

```bash
cp .env.example .env
```

Обязательные параметры:
- `SYNC_SERVICE_URL`
- `MQTT_BROKER`
- `MQTT_BROKER_PORT`

## Локальный запуск (Dart)

```bash
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

## Запуск через Docker

Сборка:

```bash
docker buildx build --platform linux/arm64 -t logo_siemens_service:latest .
```

Запуск:

```bash
docker run -d --name logo_siemens_service \
	--restart always \
	--env-file .env \
	logo_siemens_service:latest
```

## Документация
- `docs/README.md` — обзор сервиса.
- `docs/ARCHITECTURE.md` — архитектура и потоки.
- `docs/OPERATIONS.md` — эксплуатация и диагностика.
- `docs/DEPLOY_LOCAL_SERVER.md` — развертывание на Ubuntu 20+/Raspberry Pi.
