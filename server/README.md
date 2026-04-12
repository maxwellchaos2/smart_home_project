# server

`server` — центральный backend платформы Smart Home.

Сервис поднимает HTTP API, Swagger, WebSocket и связывает доменные модули (users/devices/rooms/events/scenarios/oauth и др.).

## Что внутри
- `bin/server.dart` — точка входа backend-приложения.
- `assets/openapi.yaml` — спецификация OpenAPI/Swagger.
- `compose-debug.yaml` — локальный debug-контур (DB + nginx).
- `packages/` — серверные доменные модули.
- `docs/` — полная документация по архитектуре, API, деплою и локальной отладке.

## Быстрый локальный сценарий

```bash
cd server
dart pub get
cp .env.example .env
make up-debug
```

Далее запустить backend через VS Code (`Run and Debug` → конфигурация `server`) и проверить:

```bash
curl http://localhost:8081/
curl http://localhost:8081/api/swagger
```

Остановить debug-контур:

```bash
make down
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/LOCAL_SETUP_AND_DEBUG.md`
- `docs/DEPLOY_UBUNTU_20_PLUS.md`
- `docs/api/ROUTES.md`
- `docs/api/SCHEMAS.md`
- `docs/api/AUTH_AND_ACCESS.md`
- `docs/api/WEBSOCKET_AND_EVENTS.md`

Точка входа для разработчика: `docs/LOCAL_SETUP_AND_DEBUG.md`.