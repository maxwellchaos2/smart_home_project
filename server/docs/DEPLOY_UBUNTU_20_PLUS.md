# Deploy on Ubuntu 20+ (from zero to running)

Документ описывает полный разворот `server` на чистом Ubuntu 20.04+.

## 1. Подключение к серверу

```bash
ssh <user>@<server_ip>
```

## 2. Обновить систему

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release git make
```

## 3. Установить Docker Engine + Docker Compose plugin

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Проверка:

```bash
docker --version
docker compose version
```

## 4. Дать пользователю доступ к docker без sudo

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Проверка:

```bash
docker ps
```

## 5. Клонировать проект

```bash
cd ~
git clone <YOUR_REPO_URL> smart_home
cd smart_home/server
```

## 6. Создать `.env` из шаблона

```bash
cp .env.example .env
```

Открыть файл и заполнить значения:

```bash
nano .env
```

Обязательные переменные для полного `compose.yaml`:
- `POSTGRES_PASSWORD`
- `DB_HOST`
- `PORT`
- `JWT_SECRET_KEY`
- `YANDEX_CLIENT_SECRET`
- `YANDEX_DIALOGS_SKILL_ID`
- `YANDEX_DIALOGS_OAUTH_TOKEN`
- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`

## 7. Запустить прод-контур (`compose.yaml`)

Через Makefile:

```bash
make up
```

Или напрямую:

```bash
docker compose up -d --build
```

Проверка:

```bash
docker compose ps
docker compose logs -f server
```

## 9. Запуск debug-контура на сервере (по необходимости)

```bash
docker compose -f compose-debug.yaml up -d --build
docker compose -f compose-debug.yaml ps
```

Остановка:

```bash
docker compose -f compose-debug.yaml down
```

## 10. Обновление на сервере

```bash
cd ~/smart_home/server
git pull
docker compose down
docker compose up -d --build
```

## 11. Полезные команды эксплуатации

Логи:

```bash
docker compose logs -f server
docker compose logs -f db
docker compose logs -f nginx
```

Перезапуск сервиса:

```bash
docker compose restart server
```

Остановить всё:

```bash
make down
```

## 12. Firewall (опционально, если используется UFW)

```bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status
```
