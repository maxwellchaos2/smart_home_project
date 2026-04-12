# Hikvision Controller Service

Сервис для локальной интеграции Smart Home с Hikvision terminal в одной LAN сети.

## Назначение
- Получает команды из sync/backend контура.
- Отправляет команды на Hikvision terminal.
- Получает события терминала (ISAPI alert stream).
- Нормализует и отправляет события обратно в Smart Home контур.

## Быстрый старт

1. Собрать образ на рабочей машине и передать на Raspberry Pi (через registry или `docker save`/`docker load`).

2. На Raspberry Pi подготовить env-файл:

```bash
cat > ~/hikvision_controller_service.env << 'EOF'
SYNC_SERVICE_URL=http://<sync-host>:<port>
HIKVISION_IP=<hikvision-ip>
HIKVISION_USER=<user>
HIKVISION_PASSWORD=<password>
EOF
```

3. Запустить контейнер на Raspberry Pi:

```bash
docker run -d --name hikvision_controller_service \
	--restart always \
	--env-file ~/hikvision_controller_service.env \
	hikvision_controller_service:latest
```

## Подробная документация
- [docs/README.md](docs/README.md)
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- [docs/OPERATIONS.md](docs/OPERATIONS.md)
- [docs/DEPLOY_LOCAL_SERVER.md](docs/DEPLOY_LOCAL_SERVER.md)
