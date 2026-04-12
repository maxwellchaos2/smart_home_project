# WebSocket and Events

## 1. Endpoint
- Route: `GET /ws` (upgrade)
- Module: `web_socket_core`
- Auth: JWT через `authToken` в query (`/ws?authToken=...`)

## 2. Общая схема работы
1. Клиент устанавливает websocket-соединение.
2. После auth middleware соединение проходит в `wsHandler`.
3. Сообщения попадают в `IWebSocketRepository`.
4. Модуль `events` подписывается на поток и dispatch’ит сообщения по `type`.

## 3. Типы входящих событий, обрабатываемые в `events`
- `needDeviceCapabilitiesChange`
- `deviceCapabilitiesChanged`
- `devicePropertiesChanged`
- `permitJoinZigbeeDevices`
- `newZigbeeDevice`
- `onDeviceHeartbeat`

## 4. Ошибки в обработке сообщений
- При исключении в обработчике событий `events` отправляет сообщение в topic `user-<id>`:
  - `[{ "type": "error", "message": "..." }]`

## 5. Важные ограничения
- HTTP endpoint `GET /api/events` не активен (закомментирован), реальная работа событий здесь идёт через WebSocket pipeline.
- Формат websocket payload'ов частично динамический (`List<Map>`), без строго типизированного внешнего контракта на уровне одного централизованного schema-файла.