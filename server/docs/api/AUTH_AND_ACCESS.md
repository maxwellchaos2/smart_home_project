# Auth and Access

## 1. Где подключается auth
- JWT middleware подключается в `bin/server.dart` через `authMiddleware(secretKey, publicPaths: [...])`.
- Middleware применяется до `checkProjectMiddleware` и до route handler’ов.

## 2. Public paths (без JWT)
- `api/tokens/login`
- `api/swagger`
- `api/tokens/refresh`
- `oauth/login`
- `oauth/login/submit`
- `oauth/token`

Все остальные маршруты требуют валидный JWT.

## 3. Источник токена
- Для HTTP endpoint’ов: header `Authorization: Bearer <token>`.
- Для `/ws`: query param `authToken`.

## 4. Что кладётся в request context
- При user JWT:
  - `userId`
  - `currentUser`
- При device JWT:
  - `deviceId`
  - `currentDevice`

## 5. Ошибки аутентификации
- `403 Missing or invalid Authorization header`.
- `401 Invalid or expired token`.
- `401 User not found` (ветка исключения при lookup пользователя).

## 6. Авторизация по ролям/правам

### Роль admin
- `device_positions` create/update/delete — только admin.
- `users/create` — admin, либо поток с подтверждённым `tempToken`.

### Проектные права
- Для проектных маршрутов применяется `checkProjectMiddleware`.
- Проверяется принадлежность/доступ пользователя к `projectId`.
