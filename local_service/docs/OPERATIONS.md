# Local Service Operations

## 1. Ежедневные команды

Запуск/перезапуск:

```bash
docker compose up -d
docker compose restart
```

Остановка:

```bash
docker compose down
```

Состояние и логи:

```bash
docker compose ps
docker compose logs -f
docker compose logs -f sync_service zigbee_service zigbee2mqtt voice_assistant_service
```

## 2. Обновление сервисов

Ручное обновление через watchtower:

```bash
docker login registry.smart-home-pnz.ru
docker run --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v ~/.docker/config.json:/config.json:ro \
	containrrr/watchtower \
	--run-once --cleanup
```
