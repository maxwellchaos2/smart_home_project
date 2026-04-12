# Sync Service Operations

## 1. Запуск и базовые проверки
- Создать `.env` из шаблона.
- Проверить наличие каталога с конфигом устройства (`CONFIG_DATA_PATH`, обычно `./config_data`).
- Запустить сервис через Docker (боевой сценарий) или Dart (локальная отладка).

Пример подготовки env:

```bash
cp .env.example .env
```

Локальный запуск через Dart:

```bash
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

Сборка Docker image:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t sync_service:latest .
```

## 2. Контрольные сценарии
- Без `config_data/config.json` сервис запускает BLE provisioning.
- После передачи `auth_token` сервис сохраняет данные и переходит в основной режим.
- Запросы к `/api/projects/-1/*` уходят в удаленный API уже с корректным `projectId`.
- Локальные сервисы в общем compose получают доступ к удаленному API через `sync_service`.

## 3. Мониторинг
- Логи контейнера `sync_service` (`docker logs -f sync_service`).
- Наличие heartbeat сообщений устройства.
- Состояние файла `config_data/config.json`.
- Доступность `REMOTE_SERVER_URL`.

## 4. Диагностика
- **Не работает provisioning по BLE**:
	- проверить доступ к Bluetooth/DBus внутри контейнера;
	- проверить, что хост разрешает bluetoothctl/rfkill операции.
- **Не подключается к Wi‑Fi**:
	- проверить доступность `nmcli`/NetworkManager;
	- проверить корректность `ssid/pass` из приложения.
- **401 при запросах в удаленный сервер**:
	- проверить `authToken` в `config_data/config.json`;
	- перепройти provisioning токена через Flutter приложение.
- **Прокси не подставляет projectId**:
	- проверить наличие `projectId` в `config_data/config.json`;
	- проверить, что запрос идет по шаблону `/api/projects/-1/...`.

