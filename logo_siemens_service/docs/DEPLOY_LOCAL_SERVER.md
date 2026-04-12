# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Документ для сценария, когда образ собирается на рабочей машине, а на Raspberry Pi выполняется только запуск Docker-контейнера в локальной сети.

## 1. Что нужно заранее
- Raspberry Pi (или другой локальный Linux сервер).
- Сетевой доступ до MQTT брокера.
- Сетевой доступ до sync/backend (`SYNC_SERVICE_URL`).
- Готовый Docker image, собранный на рабочей машине.

## 2. Что установить на Raspberry Pi

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl docker.io
sudo systemctl enable docker
sudo systemctl start docker
```

Проверка:

```bash
docker --version
docker ps
```

## 3. Сборка образа на рабочей машине

```bash
cd <path-to-repo>/logo_siemens_service
docker buildx build --platform linux/arm64 -t logo_siemens_service:latest .
```

## 4. Передача образа на Raspberry Pi

### Вариант A: через registry

На рабочей машине:

```bash
docker tag logo_siemens_service:latest <registry>/logo_siemens_service:latest
docker push <registry>/logo_siemens_service:latest
```

На Raspberry Pi:

```bash
docker pull <registry>/logo_siemens_service:latest
```

### Вариант B: через tar-файл

На рабочей машине:

```bash
docker save logo_siemens_service:latest -o logo_siemens_service_latest.tar
scp logo_siemens_service_latest.tar <user>@<raspberry-ip>:~
```

На Raspberry Pi:

```bash
docker load -i ~/logo_siemens_service_latest.tar
```

## 5. Создать env-файл на Raspberry Pi

```bash
cat > ~/logo_siemens_service.env << 'EOF'
SYNC_SERVICE_URL=http://<sync-host>:<port>
MQTT_BROKER=<mqtt-host>
MQTT_BROKER_PORT=1883
EOF
```

## 6. Запуск контейнера

Через registry-image:

```bash
docker rm -f logo_siemens_service 2>/dev/null || true
docker run -d --name logo_siemens_service \
  --restart always \
  --env-file ~/logo_siemens_service.env \
  <registry>/logo_siemens_service:latest
```

Через локально загруженный image:

```bash
docker rm -f logo_siemens_service 2>/dev/null || true
docker run -d --name logo_siemens_service \
  --restart always \
  --env-file ~/logo_siemens_service.env \
  logo_siemens_service:latest
```

## 7. Обновление контейнера

```bash
docker pull <registry>/logo_siemens_service:latest
docker rm -f logo_siemens_service
docker run -d --name logo_siemens_service \
  --restart always \
  --env-file ~/logo_siemens_service.env \
  <registry>/logo_siemens_service:latest
```

## 8. Полезные команды

Логи:

```bash
docker logs -f logo_siemens_service
```

Статус:

```bash
docker ps --filter name=logo_siemens_service
```

Перезапуск:

```bash
docker restart logo_siemens_service
```