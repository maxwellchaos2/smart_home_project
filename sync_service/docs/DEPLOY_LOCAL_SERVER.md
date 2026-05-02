# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Сценарий: образ собирается на рабочей машине, на малинке запускается только Docker-контейнер.

`sync_service` работает в составе общего docker compose и является центральным локальным API/WS шлюзом для других сервисов.

## 1. Предусловия
- Raspberry Pi (arm64) или Ubuntu 20+ сервер в локальной сети.
- Установлен Docker на целевой машине.
- Доступ из локальной сети до удаленного backend (`REMOTE_SERVER_URL`).
- На сборочной машине есть файл `.github_token` для `dart pub get` приватных зависимостей.

## 2. Установка Docker на Raspberry Pi
### подключение к Raspberry Pi
- Запустите Raspberry Pi Imager на вашем компьютере ([https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)).
- Выберите образ ОС: Нажмите "Выбрать ОС" (Choose OS) и выберите Raspberry Pi OS (other) → выберите полную или Lite версию.
- Настройте параметры: 
  - Включите SSH (Enable SSH): Поставьте галочку и выберите "Allow public-key authentication only" или "Use password authentication". Укажите пароль для пользователя pi.
  - Задайте имя хоста (Set hostname): Придумайте имя для вашей Pi (по умолчанию raspberrypi).
  - (Опционально) Укажите имя пользователя, пароль Wi-Fi и другие параметры.
- Запишите образ: Выберите вашу SD-карту и нажмите "Записать" (Write).
- Подключите Pi: Вставьте карту в Raspberry Pi и подключите её к компьютеру через правильный USB-порт (см. таблицу выше). Плата включится.
- Подождите около 1-2 минут для первой загрузки.
- Подключитесь по SSH: На компьютере откройте терминал (или PowerShell, или Putty) и выполните команду:
```
bash
ssh <ваше_имя_пользователя>@<ваш_hostname>.local
```
Например: 
``` ssh pi@raspberrypi.local 

Пароль: тот, что вы указали в Imager.

### установка докера на Raspberry Pi
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
cd <path-to-repo>/sync_service
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token --platform linux/arm64 -t sync_service:latest .
```

## 4. Передача образа на Raspberry Pi

### Вариант A: через registry

На рабочей машине:

```bash
docker tag sync_service:latest <registry>/sync_service:latest
docker push <registry>/sync_service:latest
```

На Raspberry Pi:

```bash
docker pull <registry>/sync_service:latest
```

### Вариант B: через tar

На рабочей машине:

```bash
docker save sync_service:latest -o sync_service_latest.tar
scp sync_service_latest.tar <user>@<raspberry-ip>:~
```

На Raspberry Pi:

```bash
docker load -i ~/sync_service_latest.tar
rm -f ~/sync_service_latest.tar
```

## 5. Подготовка данных на Raspberry Pi

Создать env файл:

```bash
cat > ~/sync_service.env << 'EOF'
REMOTE_SERVER_URL=https://api.smart-home.example
CONFIG_DATA_PATH=/app/config_data
PORTT=8080
EOF
```

Подготовить каталог для конфигурации устройства:

```bash
mkdir -p ~/smart_home/config_data
```

## 6. Запуск контейнера отдельно

```bash
docker rm -f sync_service 2>/dev/null || true
docker run -d --name sync_service \
  --restart always \
  --env-file ~/sync_service.env \
  -v ~/smart_home/config_data:/app/config_data \
  -p 8082:8080 \
  --privileged \
  sync_service:latest
```

Примечание: в production обычно запускается через общий `local_service/compose.yaml`, где остальные сервисы обращаются к `sync_service` по внутреннему имени сервиса.

## 7. Запуск в составе общего compose

Если используется `local_service/compose.yaml`, важно:
- у `sync_service` был volume `~/smart_home/config_data:/app/config_data`;
- остальные сервисы использовали `SYNC_SERVICE_URL=http://sync_service:8080`;
- контейнер `sync_service` был поднят и healthy до зависимых сервисов.

## 8. Проверка после запуска

```bash
docker logs -f sync_service
docker ps --filter name=sync_service
```

Проверить, что:
- без `config.json` сервис вошел в BLE provisioning режим;
- после provisioning появился `~/smart_home/config_data/config.json`;
- сервис начал проксировать запросы с токеном и projectId.

## 9. Обновление

```bash
docker rm -f sync_service
docker run -d --name sync_service \
  --restart always \
  --env-file ~/sync_service.env \
  -v ~/smart_home/config_data:/app/config_data \
  -p 8082:8080 \
  --privileged \
  sync_service:latest
```
