# Deploy on Local Server (Raspberry Pi / Ubuntu 20+)

Сценарий: `local_service` переносится на сервер как папка и запускается единым `docker compose`.

## 1. Предусловия
- На сервере установлен Docker с поддержкой `docker compose`.
- На сервере есть доступ в registry: `registry.smart-home-pnz.ru`.
- На сервере доступны устройства:
  - Zigbee-адаптер (`/dev/ttyUSB*`),
  - USB/Bluetooth (`/dev/bus/usb`, dbus),
  - звук (`/dev/snd`) для voice assistant.

## 2. Перенос папки

На рабочей машине:

```bash
scp -r local_service <user>@<server-ip>:~/smart_home
```

На сервере:

```bash
cd ~/smart_home/local_service
```

## 3. Подготовка окружения

```bash
cp .env.example .env
```

Проверьте минимум:
- `SYNC_SERVICE_URL`
- `REMOTE_SERVER_URL`
- `ZIGBEE_ADAPTER`, `ZIGBEE_ADAPTER_PORT`
- `VOSK_URL`, `RHVOICE_URL`

## 4. Локальные директории для volume

Если нужно, создайте каталоги:

```bash
mkdir -p ~/smart_home/config_data
mkdir -p ~/smart_home/mosquitto/config ~/smart_home/mosquitto/data
mkdir -p ~/smart_home/zigbee2mqtt/data
```

## 5. Запуск compose

```bash
docker login registry.smart-home-pnz.ru
docker compose up -d
```

## 6. Проверка

```bash
docker compose ps
docker compose logs -f sync_service zigbee_service zigbee2mqtt voice_assistant_service
```

Проверить дополнительно:
- Zigbee2MQTT web: `http://<server-ip>:8080`
- `sync_service` порт: `8082`

## 7. Обновление

```bash
docker compose pull
docker compose up -d
```

Или через one-shot watchtower:

```bash
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/.docker/config.json:/config.json:ro \
  containrrr/watchtower \
  --run-once --cleanup
```
