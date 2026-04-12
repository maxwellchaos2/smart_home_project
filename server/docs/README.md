# Server Service Documentation

## 1. Назначение
`server` — центральный backend платформы Smart Home. Он поднимает HTTP/API и WebSocket точки входа, инициализирует доменные модули и применяет общие middleware (логирование, CORS, auth, project-check).

## 2. Что включено в документацию
- [ARCHITECTURE.md](ARCHITECTURE.md) — архитектурные слои и основные компоненты.
- [LOCAL_SETUP_AND_DEBUG.md](LOCAL_SETUP_AND_DEBUG.md) — подробный локальный запуск (Docker Compose debug + VS Code launch).
- [DEPLOY_UBUNTU_20_PLUS.md](DEPLOY_UBUNTU_20_PLUS.md) — пошаговый деплой на чистый Ubuntu 20+.
- [api/ROUTES.md](api/ROUTES.md) — полный реестр HTTP/WebSocket маршрутов.
- [api/SCHEMAS.md](api/SCHEMAS.md) — request/response модели и поля.
- [api/AUTH_AND_ACCESS.md](api/AUTH_AND_ACCESS.md) — JWT, публичные пути, доступы.
- [api/WEBSOCKET_AND_EVENTS.md](api/WEBSOCKET_AND_EVENTS.md) — `/ws` и события из `events`.

## 3. Быстрая сводка API
- Всего активных маршрутов: 48 (HTTP + WebSocket upgrade).
- Публичных путей (без JWT): `/api/swagger`, `/api/tokens/login`, `/api/tokens/refresh`, `/oauth/login`, `/oauth/login/submit`, `/oauth/token`.
- Защищённые JWT middleware: все остальные маршруты, включая `/ws`.
- Неактивный endpoint: `GET /api/events` (закомментирован; в активные 48 не входит).

## 4. Модули, подключаемые в `bin/server.dart`
- Projects, RefreshToken, AuthToken, Users, Devices, Rooms, Floors.
- InOutScenario, DeviceScenario, DevicePositions.
- OAuth, YandexAuth, YandexDialogs, YandexDevices.
- EmailVerification, WebSocketCore, Events, SMTP.

## 5. Порядок чтения
1. [LOCAL_SETUP_AND_DEBUG.md](LOCAL_SETUP_AND_DEBUG.md)
2. [DEPLOY_UBUNTU_20_PLUS.md](DEPLOY_UBUNTU_20_PLUS.md)
3. [api/AUTH_AND_ACCESS.md](api/AUTH_AND_ACCESS.md)
4. [api/ROUTES.md](api/ROUTES.md)
5. [api/SCHEMAS.md](api/SCHEMAS.md)
6. [api/WEBSOCKET_AND_EVENTS.md](api/WEBSOCKET_AND_EVENTS.md)
