# Server API Routes

Документ фиксирует активные маршруты из:
- `server/bin/server.dart`
- `server/packages/*/lib/src/application/handlers/handlers.dart`

## 1. Системные маршруты

### GET /
- Module: `server`
- Handler: `_rootHandler`
- Path params: нет
- Query params: нет
- Body: нет
- Response: `text/plain` (`Hello, World!\n`)
- Auth: JWT (не включён в `publicPaths`)

### GET /echo/<message>
- Module: `server`
- Handler: `_echoHandler`
- Path params: `message: String`
- Query params: нет
- Body: нет
- Response: `text/plain` (`<message>\n`)
- Auth: JWT

### GET /api/swagger
- Module: `server`
- Handler: `_swaggerHandler`
- Path params: нет
- Query params: нет
- Body: нет
- Response: `text/html`
- Auth: public

## 2. Auth / OAuth

### POST /api/tokens/login
- Module: `auth_token`
- Handler: `loginHandler`
- Body: inline JSON `{ username: String, password: String }`
- Response: inline JSON `{ token: String, refreshToken: String }`
- Auth: public
- Типовые ошибки: `403 invalid credentials`

### POST /api/tokens/refresh
- Module: `auth_token`
- Handler: `refreshTokenHandler`
- Body:
  - JSON `{ refreshToken: String }`
  - или `application/x-www-form-urlencoded` с `refresh_token` (ветка совместимости)
- Response: inline JSON:
  - `token`, `refreshToken`
  - `access_token`, `refresh_token`, `expires_in`, `token_type`
- Auth: public

### POST /api/tokens/revoke
- Module: `auth_token`
- Handler: `revokeTokenHandler`
- Body: inline JSON `{ refreshToken: String }`
- Response: plain message (`Token revoked`)
- Auth: JWT

### POST /api/tokens/login-device
- Module: `auth_token`
- Handler: `loginDeviceHandler`
- Body: inline JSON `{ deviceId: int }`
- Response: inline JSON `{ token: String, refreshToken: null }`
- Auth: JWT
- Типовые ошибки: `403 invalid device`

### GET /oauth/login
- Module: `oauth`
- Handler: `loginHandler`
- Query params:
  - `state`
  - `redirect_uri`
  - `client_id`
  - `response_type`
- Body: нет
- Response: `text/html` (форма логина)
- Auth: public
- Типовые ошибки: `400 invalid response_type/client_id`

### POST /oauth/login/submit
- Module: `oauth`
- Handler: `loginSubmitHandler`
- Body: `application/x-www-form-urlencoded`
  - `username`, `password`, `state`, `scope`, `redirect_uri`, `client_id`
- Response: `302 redirect`
- Auth: public
- Типовые ошибки: `400 invalid credentials`

### POST /oauth/token
- Module: `oauth`
- Handler: `tokenHandler`
- Body: `application/x-www-form-urlencoded`
  - `code`, `client_id`, `client_secret`, `grant_type`
- Response: inline JSON `{ access_token, refresh_token, expires_in, token_type }`
- Auth: public
- Типовые ошибки: `400 invalid grant/client/code`

## 3. Users / Projects

### GET /api/users/me
- Module: `users`
- Handler: `userMeHandler`
- Response model: `UserResponseModel`
- Auth: JWT

### POST /api/users/create
- Module: `users`
- Handler: `createUserHandler`
- Query params:
  - `tempToken` (опционально, верификация email)
- Body model: `CreateUserRequestModel`
- Response model: `UserResponseModel`
- Auth: JWT
- Ограничения: admin-only без `tempToken`

### POST /api/projects/create
- Module: `projects`
- Handler: `createProjectHandler`
- Body model: `CreateProjectRequestModel`
- Response model: `ProjectResponseModel`
- Auth: JWT

### GET /api/projects
- Module: `projects`
- Handler: `fetchMyProjectsHandler`
- Response: `ProjectResponseModel[]`
- Auth: JWT

## 4. Rooms / Floors

### GET /api/projects/<projectId>/rooms
- Module: `rooms`
- Handler: `fetchRoomsHandler`
- Path params: `projectId: int`
- Response: `RoomResponseModel[]`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/rooms/create
- Module: `rooms`
- Handler: `createRoomHandler`
- Path params: `projectId: int`
- Body model: `RoomInputRequestModel`
- Дополнительно:
  - multipart-поле `planFile` или
  - JSON поле `plan_media_path`
- Response: `RoomResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### PUT /api/projects/<projectId>/rooms/<id>/update
- Module: `rooms`
- Handler: `updateRoomHandler`
- Path params: `projectId: int`, `id: int`
- Body model: `RoomInputRequestModel` (+ multipart/json ветки для плана)
- Response: `RoomResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### DELETE /api/projects/<projectId>/rooms/<id>/delete
- Module: `rooms`
- Handler: `deleteRoomHandler`
- Path params: `projectId: int`, `id: int`
- Response: inline JSON `{ message: String }`
- Auth: JWT + `checkProjectMiddleware`

### GET /api/projects/<projectId>/floors
- Module: `floors`
- Handler: `fetchFloorsHandler`
- Path params: `projectId: int`
- Response: `FloorResponseModel[]`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/floors/create
- Module: `floors`
- Handler: `createFloorHandler`
- Path params: `projectId: int`
- Body model: `CreateFloorRequestModel`
- Дополнительно: multipart `planFile`
- Response: `FloorResponseModel`
- Auth: JWT + `checkProjectMiddleware`

## 5. Devices / Device Positions

### GET /api/projects/<projectId>/devices
- Module: `devices`
- Handler: `fetchDevicesHandler`
- Path params: `projectId: int`
- Response: `DeviceResponseModel[]`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/devices/create
- Module: `devices`
- Handler: `createDeviceHandler`
- Path params: `projectId: int`
- Body model: `DeviceInputRequestModel`
- Response: `DeviceResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### GET /api/projects/<projectId>/devices/<id>
- Module: `devices`
- Handler: `fetchDeviceHandler`
- Path params: `projectId: int`, `id: int`
- Response: `DeviceResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### PUT /api/projects/<projectId>/devices/<id>/update
- Module: `devices`
- Handler: `updateDeviceHandler`
- Path params: `projectId: int`, `id: int`
- Body model: `DeviceInputRequestModel`
- Response: `DeviceResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### DELETE /api/projects/<projectId>/devices/<id>/delete
- Module: `devices`
- Handler: `deleteDeviceHandler`
- Path params: `projectId: int`, `id: int`
- Response: inline JSON `{ message: String }`
- Auth: JWT + `checkProjectMiddleware`

### GET /api/device-positions
- Module: `device_positions`
- Handler: `fetchDevicePositionsHandler`
- Response: `DevicePositionResponseModel[]`
- Auth: JWT

### POST /api/device-positions/create
- Module: `device_positions`
- Handler: `createDevicePositionHandler`
- Body model: `DevicePositionInputRequestModel`
- Дополнительно: multipart `iconFile`, `disabledIconFile`
- Response: `DevicePositionResponseModel`
- Auth: JWT (admin-only)

### PUT /api/device-positions/<id>/update
- Module: `device_positions`
- Handler: `updateDevicePositionHandler`
- Path params: `id: int`
- Body model: `DevicePositionInputRequestModel`
- Дополнительно: multipart `iconFile`, `disabledIconFile`
- Response: `DevicePositionResponseModel`
- Auth: JWT (admin-only)

### DELETE /api/device-positions/<id>/delete
- Module: `device_positions`
- Handler: `deleteDevicePositionHandler`
- Path params: `id: int`
- Response: inline JSON `{ message: String }`
- Auth: JWT (admin-only)

## 6. Device Scenario / InOut Scenario

### GET /api/projects/<projectId>/device_scenarios
- Module: `device_scenario`
- Handler: `fetchDeviceScenariosHandler`
- Path params: `projectId: int`
- Response: `DeviceScenarioResponseModel[]`
- Auth: JWT + `checkProjectMiddleware`

### GET /api/projects/<projectId>/device_scenarios/<id>
- Module: `device_scenario`
- Handler: `fetchDeviceScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Response: `DeviceScenarioResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/device_scenarios/create
- Module: `device_scenario`
- Handler: `createDeviceScenarioHandler`
- Body model: `DeviceScenarioInputRequestModel`
- Response: `DeviceScenarioResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### PUT /api/projects/<projectId>/device_scenarios/<id>/update
- Module: `device_scenario`
- Handler: `updateDeviceScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Body model: `DeviceScenarioInputRequestModel`
- Response: `DeviceScenarioResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### DELETE /api/projects/<projectId>/device_scenarios/<id>/delete
- Module: `device_scenario`
- Handler: `deleteDeviceScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Response: inline JSON `{ message: String }`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/device_scenarios/<id>/run
- Module: `device_scenario`
- Handler: `runDeviceScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Body: нет
- Response: inline JSON `{ status: String }`
- Auth: JWT + `checkProjectMiddleware`

### GET /api/projects/<projectId>/inout_scenarios
- Module: `inout_scenario`
- Handler: `fetchInOutScenariosHandler`
- Path params: `projectId: int`
- Response: `InOutScenarioResponseModel[]`
- Auth: JWT + `checkProjectMiddleware`

### POST /api/projects/<projectId>/inout_scenarios/create
- Module: `inout_scenario`
- Handler: `createInOutScenarioHandler`
- Body model: `InOutScenarioInputRequestModel`
- Response: `InOutScenarioResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### PUT /api/projects/<projectId>/inout_scenarios/<id>/update
- Module: `inout_scenario`
- Handler: `updateInOutScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Body model: `InOutScenarioInputRequestModel`
- Response: `InOutScenarioResponseModel`
- Auth: JWT + `checkProjectMiddleware`

### DELETE /api/projects/<projectId>/inout_scenarios/<id>/delete
- Module: `inout_scenario`
- Handler: `deleteInOutScenarioHandler`
- Path params: `projectId: int`, `id: int`
- Response: inline JSON `{ message: String }`
- Auth: JWT + `checkProjectMiddleware`

## 7. Yandex интеграции

### POST /api/yandex-auth/token
- Module: `yandex_auth`
- Handler: `authByCodeHandler`
- Body: inline JSON `{ code: String }`
- Response: text `Success`
- Auth: JWT

### POST /api/yandex-auth/revoke
- Module: `yandex_auth`
- Handler: `revokeTokenHandler`
- Body: нет
- Response: text `Success`
- Auth: JWT

### POST /api/projects/<projectId>/yandex-devices/update
- Module: `yandex_devices`
- Handler: `updateDevicesHandler`
- Path params: `projectId: int`
- Body: нет
- Response: text `Success`
- Auth: JWT + `checkProjectMiddleware`

### HEAD /yandex/v1.0
- Module: `yandex_dialogs`
- Handler: `checkHandler`
- Body: нет
- Response: `OK`
- Auth: JWT

### GET /yandex/v1.0/user/devices
- Module: `yandex_dialogs`
- Handler: `fetchDevicesHandler`
- Body: нет
- Response: envelope:
  - `request_id`
  - `payload.user_id`
  - `payload.devices: YandexDeviceResponseModel[]`
- Auth: JWT

### POST /yandex/v1.0/user/devices/query
- Module: `yandex_dialogs`
- Handler: `fetchDevicesStateHandler`
- Body model: `DevicesStateInputRequestModel`
- Response: envelope `request_id + payload.devices[]`
- Auth: JWT

### POST /yandex/v1.0/user/devices/action
- Module: `yandex_dialogs`
- Handler: `actionDevicesHandler`
- Body: payload c `devices[]` (`ActionDeviceRequestModel`)
- Response: envelope c `devices[]` (`ActionDeviceResultResponseModel`)
- Auth: JWT

## 8. Email verification

### POST /email_verification/send_code
- Module: `email_verification`
- Handler: `sendCodeHandler`
- Body: inline JSON `{ email: String }`
- Response: inline JSON `{ message: String }`
- Auth: JWT
- Типовые ошибки: `429` (rate limit)

### POST /email_verification/confirm_code
- Module: `email_verification`
- Handler: `confirmCodeHandler`
- Body: inline JSON `{ email: String, code: String }`
- Response: inline JSON `{ tempToken: String }`
- Auth: JWT
- Типовые ошибки: `400 invalid/expired code`

## 9. WebSocket

### GET /ws (upgrade)
- Module: `web_socket_core`
- Handler: `wsHandler`
- Query params: `authToken` (обязателен)
- Body: нет
- Response: WebSocket upgrade
- Auth: JWT (особая ветка middleware: токен из query)
