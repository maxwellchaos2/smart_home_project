# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Документ для сценария, когда образ собирается на рабочей машине, а на Raspberry Pi выполняется только запуск Docker-контейнера в LAN с Hikvision terminal.

## 1. Что нужно заранее
- Сервер Ubuntu 20+ или Raspberry Pi OS.
- Сетевой доступ до Hikvision terminal.
- Сетевой доступ до sync/backend сервиса (`SYNC_SERVICE_URL`).
- Учетные данные ISAPI (`HIKVISION_USER` / `HIKVISION_PASSWORD`).
- Готовый Docker image сервиса (собранный на вашей машине).

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

Сборка должна идти под архитектуру малинки (`linux/arm64`).

```bash
cd <path-to-repo>/hikvision_controller_service
docker buildx build --platform linux/arm64 -t hikvision_controller_service:latest .
```

Если используете приватные зависимости и secret token:

```bash
DOCKER_BUILDKIT=1 docker buildx build \
  --platform linux/arm64 \
  --secret id=github_token,src=.github_token \
  -t hikvision_controller_service:latest .
```

## 4. Передача образа на Raspberry Pi

### Вариант A: через registry

На рабочей машине:

```bash
docker tag hikvision_controller_service:latest <registry>/hikvision_controller_service:latest
docker push <registry>/hikvision_controller_service:latest
```

На Raspberry Pi:

```bash
docker pull <registry>/hikvision_controller_service:latest
```

### Вариант B: через tar-файл

На рабочей машине:

```bash
docker save hikvision_controller_service:latest -o hikvision_controller_service_latest.tar
scp hikvision_controller_service_latest.tar <user>@<raspberry-ip>:~
```

На Raspberry Pi:

```bash
docker load -i ~/hikvision_controller_service_latest.tar
```

## 5. Создать env-файл на Raspberry Pi

```bash
cat > ~/hikvision_controller_service.env << 'EOF'
SYNC_SERVICE_URL=http://<sync-host>:<port>
HIKVISION_IP=<hikvision-ip>
HIKVISION_USER=<user>
HIKVISION_PASSWORD=<password>
EOF
```

## 6. Запуск контейнера на Raspberry Pi

```bash
docker rm -f hikvision_controller_service 2>/dev/null || true
docker run -d --name hikvision_controller_service \
  --restart always \
  --env-file ~/hikvision_controller_service.env \
  <registry>/hikvision_controller_service:latest
```

Если используется локально загруженный образ (через `docker load`):

```bash
docker rm -f hikvision_controller_service 2>/dev/null || true
docker run -d --name hikvision_controller_service \
  --restart always \
  --env-file ~/hikvision_controller_service.env \
  hikvision_controller_service:latest
```

## 7. Обновление сервиса на Raspberry Pi

Через registry:

```bash
docker pull <registry>/hikvision_controller_service:latest
docker rm -f hikvision_controller_service
docker run -d --name hikvision_controller_service \
  --restart always \
  --env-file ~/hikvision_controller_service.env \
  <registry>/hikvision_controller_service:latest
```

Через tar:

```bash
docker load -i ~/hikvision_controller_service_latest.tar
docker rm -f hikvision_controller_service
docker run -d --name hikvision_controller_service \
  --restart always \
  --env-file ~/hikvision_controller_service.env \
  hikvision_controller_service:latest
```

## 8. Полезные команды на Raspberry Pi

Логи:

```bash
docker logs -f hikvision_controller_service
```

Статус:

```bash
docker ps --filter name=hikvision_controller_service
```

Рестарт:

```bash
docker restart hikvision_controller_service
```

Остановка:

```bash
docker stop hikvision_controller_service
```

Удаление контейнера:

```bash
docker rm -f hikvision_controller_service
```
