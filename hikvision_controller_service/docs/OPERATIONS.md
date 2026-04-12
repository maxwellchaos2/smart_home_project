# Hikvision Controller Operations

## 1. Локальный запуск
- Выполнить `dart pub get` в каталоге сервиса.
- Запустить сервис через `dart run` или команды из `Makefile`.
- Подключить тестовые credentials/endpoint Hikvision в env-конфиг.

Шаблон env:

```bash
cp .env.example .env
```

Для запуска из shell:

```bash
set -a
source .env
set +a
dart run bin/server.dart
```

## 2. Прод-эксплуатация
- Мониторить долю ошибок интеграции и p95/p99 latency.
- Фиксировать изменения внешних API/прошивок Hikvision.
- Поддерживать совместимость контрактов с upstream/downstream.

## 3. Инциденты
- Рост таймаутов: проверить сеть и rate-limit внешнего API.
- Неполные статусы: сверить маппинг полей normalizer.
- Повторные команды: проверить idempotency key и дедупликацию.

## 4. Полезные команды

Проверка сетевой доступности терминала:

```bash
ping <HIKVISION_IP>
curl -u <HIKVISION_USER>:<HIKVISION_PASSWORD> http://<HIKVISION_IP>/ISAPI/System/status
```

Сборка Docker-образа:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t hikvision_controller_service:latest .
```

