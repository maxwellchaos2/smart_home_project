# LOGO Controller Service

Сервис для управления светом через Siemens LOGO в локальной сети.

## Назначение
- Получает команды из sync/backend контура Smart Home.
- Преобразует команды в операции на выходах Siemens LOGO (`Q` каналы).
- Считывает изменения выходов LOGO и отправляет события обратно в платформу.
- Используется как локальный bridge (обычно на Raspberry Pi).

## Быстрый старт (docker на малинке)

1. Собрать образ на рабочей машине (под `linux/arm64`) и передать на малинку.
2. Создать env-файл на малинке:

```bash
cat > ~/logo_controller_service.env << 'EOF'
SYNC_SERVICE_URL=http://<sync-host>:<port>
LOGO_CONTROLLER_IP=<logo-ip>
SNAP7_LIBRARY_PATH=
EOF
```

3. Запустить контейнер:

```bash
docker run -d --name logo_controller_service \
  --restart always \
  --env-file ~/logo_controller_service.env \
  logo_controller_service:latest
```

## Подробная документация
- [docs/README.md](docs/README.md)
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- [docs/OPERATIONS.md](docs/OPERATIONS.md)
- [docs/DEPLOY_LOCAL_SERVER.md](docs/DEPLOY_LOCAL_SERVER.md)
