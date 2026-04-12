# Local Setup and Debug (VS Code + Docker Compose)

## 1. Что установить в самом начале

Минимальный набор для комфортного локального запуска и отладки на macOS:

1. **VS Code**
   - Установленная рабочая версия.
2. **Расширение Dart для VS Code**
   - ID: `Dart-Code.dart-code`.
3. **Dart SDK**
   - В `pubspec.yaml` задано: `sdk: ^3.5.3`.
   - Используйте совместимую версию `3.5.x` или выше в рамках ограничения SDK.
4. **Docker Desktop**
   - Установленная рабочая версия.
5. **Docker Compose v2** (обычно уже внутри Docker Desktop)
   - Проверка: `docker compose version`.
   - Нужен Compose v2.

Проверочные команды:

```bash
code --version
dart --version
docker --version
docker compose version
```

---

## 2. Подготовка проекта

В корне сервиса:

```bash
cd server
dart pub get
```

Если зависимости не подтянулись:

```bash
dart clean
dart pub get
```

---

## 3. Поднять локальное окружение для debug через Docker Compose

Для debug-контура используется `compose-debug.yaml`.

Перед запуском compose создайте **локальный** файл `.env` в папке `server`.
`docker compose` читает этот файл автоматически.

Шаги:

```bash
cp .env.example .env
```

Далее откройте `.env` и заполните значения.

Для старта `compose-debug.yaml` обязателен параметр `POSTGRES_PASSWORD`.

### Вариант A: через Makefile

```bash
make up-debug
```

Что поднимается:
- `db` (PostgreSQL) на `5432`.
- `nginx-debug` на `8080`.

Остановить debug-контур:

```bash
make down
```

### Вариант B: напрямую через docker compose

```bash
docker compose -f compose-debug.yaml up -d --build
```

Остановить:

```bash
docker compose -f compose-debug.yaml down
```

Проверить статус:

```bash
docker compose -f compose-debug.yaml ps
docker compose -f compose-debug.yaml logs -f db
```

---

## 4. Запуск server через VS Code

В проекте есть конфигурация запуска в `.vscode/launch.json`:
- launch name: `server`
- entrypoint: `bin/server.dart`
- env-переменные прокидываются через `toolArgs --define=...`

Запуск:
1. Открыть `Run and Debug`.
2. Выбрать конфигурацию `server`.
3. Нажать `Start Debugging` (`F5`).

Ожидаемое поведение:
- Приложение стартует на порту из `--define=PORT` (сейчас в launch-конфиге это `8081`).
- БД берётся с `DB_HOST=localhost` и `POSTGRES_PASSWORD` из launch-конфига.

Проверка после старта:

```bash
curl http://localhost:8081/
curl http://localhost:8081/api/swagger
```

---

## 5. Важные замечания по переменным окружения

Сейчас стратегия такая:
- для локальной отладки все `ENV` задаются в `.vscode/launch.json` через `--define`;
- этого достаточно для старта server без отдельного `.env` для самого dart-процесса.
- для `docker compose` используется `.env`, созданный из `.env.example`.


## 7. Быстрый рабочий сценарий

1. Поднять инфраструктуру:

```bash
cd server
make up-debug
```

2. Запустить backend из VS Code (`F5`, конфигурация `server`).
3. Открыть Swagger: `http://localhost:8081/api/swagger`.
4. После работы остановить контейнеры:

```bash
make down
```

---
