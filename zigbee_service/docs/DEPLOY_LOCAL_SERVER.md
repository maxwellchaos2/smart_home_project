# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Сценарий: образ `zigbee_service` собирается на рабочей машине, на Raspberry Pi сервис запускается в составе общего Docker Compose.

## 1. Важные зависимости
Для работы `zigbee_service` в compose обязательно должны быть подняты:
- `mqtt` (broker)
- `zigbee2mqtt`
- `sync_service`

Без `zigbee2mqtt` сервис не получает Zigbee события и не может отправлять команды устройствам.

## 2. Предусловия
- Raspberry Pi (arm64) / Ubuntu 20+.
- Docker на целевой машине.
- На сборочной машине есть `.github_token` для приватных зависимостей.

## 3. Сборка image на рабочей машине

```bash
cd <path-to-repo>/zigbee_service
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token --platform linux/arm64 -t zigbee_service:latest .
```

## 4. Передача image на Raspberry Pi

### Вариант A: registry

```bash
docker tag zigbee_service:latest <registry>/zigbee_service:latest
docker push <registry>/zigbee_service:latest
```

На малинке:

```bash
docker pull <registry>/zigbee_service:latest
```

### Вариант B: tar

На рабочей машине:

```bash
docker save zigbee_service:latest -o zigbee_service_latest.tar
scp zigbee_service_latest.tar <user>@<raspberry-ip>:~
```

На малинке:

```bash
docker load -i ~/zigbee_service_latest.tar
rm -f ~/zigbee_service_latest.tar
```

## 5. env для zigbee_service

```bash
cat > ~/zigbee_service.env << 'EOF'
SYNC_SERVICE_URL=http://sync_service:8080
ZIGBEE_BROKER=mqtt
ZIGBEE_PORT=1883
EOF
```

## 6. Compose требования

В `local_service/compose.yaml` должно быть:
- `zigbee_service` в той же сети, что `mqtt`, `zigbee2mqtt`, `sync_service`;
- env для `zigbee_service`: `SYNC_SERVICE_URL`, `ZIGBEE_BROKER`, `ZIGBEE_PORT`;
- `zigbee2mqtt` подключен к `mqtt://mqtt:1883`;
- у `zigbee2mqtt` проброшен Zigbee адаптер (`/dev/ttyUSB*`).

## 7. Запуск и проверка

```bash
docker compose up -d mqtt zigbee2mqtt sync_service zigbee_service
docker compose logs -f zigbee_service
```

Проверить:
- есть входящие сообщения из `zigbee2mqtt/#`;
- при изменениях устройств появляются `deviceCapabilitiesChanged`/`devicePropertiesChanged`;
- команды платформы превращаются в публикации `zigbee2mqtt/<device>/set`.

## 8. Обновление

```bash
docker compose pull zigbee_service
docker compose up -d zigbee_service
docker compose logs -f zigbee_service
```
