# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Сценарий: образ `scenarios_service` собирается на рабочей машине, на малинке запускается контейнер в составе общего Docker Compose.

Ключевая особенность: сервис работает через `sync_service` в той же compose-сети.

## 1. Предусловия
- Raspberry Pi (arm64) или Ubuntu 20+.
- Docker на целевой машине.
- В общем compose уже поднят `sync_service`.
- На сборочной машине есть `.github_token` для приватных зависимостей при `dart pub get`.

## 2. Установка Docker на Raspberry Pi

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl docker.io
sudo systemctl enable docker
sudo systemctl start docker
```

## 3. Сборка образа на рабочей машине

```bash
cd <path-to-repo>/scenarios_service
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token --platform linux/arm64 -t scenarios_service:latest .
```

## 4. Передача образа на Raspberry Pi

### Вариант A: через registry

На рабочей машине:

```bash
docker tag scenarios_service:latest <registry>/scenarios_service:latest
docker push <registry>/scenarios_service:latest
```

На малинке:

```bash
docker pull <registry>/scenarios_service:latest
```

### Вариант B: через tar

На рабочей машине:

```bash
docker save scenarios_service:latest -o scenarios_service_latest.tar
scp scenarios_service_latest.tar <user>@<raspberry-ip>:~
```

На малинке:

```bash
docker load -i ~/scenarios_service_latest.tar
rm -f ~/scenarios_service_latest.tar
```

## 5. Подготовка env

```bash
cat > ~/scenarios_service.env << 'EOF'
SYNC_SERVICE_URL=http://sync_service:8080
EOF
```

## 6. Запуск отдельно (для диагностики)

```bash
docker rm -f scenarios_service 2>/dev/null || true
docker run -d --name scenarios_service \
  --restart always \
  --env-file ~/scenarios_service.env \
  --network app-network \
  scenarios_service:latest
```

Обычно запуск выполняется через общий `local_service/compose.yaml`.

## 7. Запуск в составе общего compose

Убедиться, что в `local_service/compose.yaml`:
- у `scenarios_service` задано `SYNC_SERVICE_URL=http://sync_service:8080`;
- `depends_on` включает `sync_service`;
- сервис подключен к той же сети, что и `sync_service`.

## 8. Проверка

```bash
docker logs -f scenarios_service
docker ps --filter name=scenarios_service
```

Проверить в логах:
- успешное подключение к events через `sync_service`;
- обработку `deviceStateChanged`;
- отправку `needDeviceCapabilitiesChange`.

## 9. Обновление

```bash
docker rm -f scenarios_service
docker run -d --name scenarios_service \
  --restart always \
  --env-file ~/scenarios_service.env \
  --network app-network \
  scenarios_service:latest
```
