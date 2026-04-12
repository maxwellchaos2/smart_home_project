# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Документ для сценария, когда образ собирается на рабочей машине, а на Raspberry Pi выполняется только запуск Docker-контейнера в LAN с Siemens LOGO.

## 1. Что нужно заранее
- Raspberry Pi (или другой локальный Linux сервер) в той же сети, что и LOGO.
- Доступ к sync/backend сервису по `SYNC_SERVICE_URL`.
- Готовый Docker image сервиса, собранный на вашей машине.

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

Собирать под архитектуру малинки:

```bash
cd <path-to-repo>/logo_controller_service
docker buildx build --platform linux/arm64 -t logo_controller_service:latest .
```

Если нужны приватные зависимости:

```bash
DOCKER_BUILDKIT=1 docker buildx build \
  --platform linux/arm64 \
  --secret id=github_token,src=.github_token \
  -t logo_controller_service:latest .
```

## 4. Передача образа на Raspberry Pi

### Вариант A: через registry

На рабочей машине:

```bash
docker tag logo_controller_service:latest <registry>/logo_controller_service:latest
docker push <registry>/logo_controller_service:latest
```

На Raspberry Pi:

```bash
docker pull <registry>/logo_controller_service:latest
```

### Вариант B: через tar-файл

На рабочей машине:

```bash
docker save logo_controller_service:latest -o logo_controller_service_latest.tar
scp logo_controller_service_latest.tar <user>@<raspberry-ip>:~
```

На Raspberry Pi:

```bash
docker load -i ~/logo_controller_service_latest.tar
```

## 5. Создать env-файл на Raspberry Pi

```bash
cat > ~/logo_controller_service.env << 'EOF'
SYNC_SERVICE_URL=http://<sync-host>:<port>
LOGO_CONTROLLER_IP=<logo-ip>
SNAP7_LIBRARY_PATH=
EOF
```

## 6. Запуск контейнера на Raspberry Pi

Через registry-image:

```bash
docker rm -f logo_controller_service 2>/dev/null || true
docker run -d --name logo_controller_service \
  --restart always \
  --env-file ~/logo_controller_service.env \
  <registry>/logo_controller_service:latest
```

Через локально загруженный image:

```bash
docker rm -f logo_controller_service 2>/dev/null || true
docker run -d --name logo_controller_service \
  --restart always \
  --env-file ~/logo_controller_service.env \
  logo_controller_service:latest
```

## 7. Обновление контейнера

```bash
docker pull <registry>/logo_controller_service:latest
docker rm -f logo_controller_service
docker run -d --name logo_controller_service \
  --restart always \
  --env-file ~/logo_controller_service.env \
  <registry>/logo_controller_service:latest
```

## 8. Полезные команды

Логи:

```bash
docker logs -f logo_controller_service
```

Статус:

```bash
docker ps --filter name=logo_controller_service
```

Перезапуск:

```bash
docker restart logo_controller_service
```
