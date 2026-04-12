# local_service

`local_service` — это инфраструктурная папка для edge-контурa на Raspberry Pi/Ubuntu-сервере.

Ключевая идея: папка целиком переносится на сервер и запускается как единый `docker compose`, который объединяет локальные сервисы (`sync_service`, `zigbee_service`, `voice_assistant_service`, `scenarios_service`, `logo_controller_service`, `hikvision_controller_service`) и их инфраструктуру (`mqtt`, `zigbee2mqtt`, `vosk-server`, `rhvoice-server`).

## Что находится в папке
- `compose.yaml` — основной оркестратор контейнеров.
- `mosquitto/`, `zigbee2mqtt/` — конфиги и данные локальной интеграции Zigbee.
- `scripts/` — скрипты запуска/деплоя/подготовки.
- `Makefile` — быстрые команды для операционных задач.

## Быстрый сценарий: перенести и запустить

1. Скопировать папку на сервер (пример):

```bash
scp -r local_service <user>@<server-ip>:~/smart_home
```

2. На сервере перейти в папку и создать `.env`:

```bash
cd ~/smart_home/local_service
cp .env.example .env
```

3. Запустить стек:

```bash
docker compose up -d
```

4. Проверить статус:

```bash
docker compose ps
docker compose logs -f sync_service zigbee_service zigbee2mqtt voice_assistant_service
```

## Обновление контейнеров

Ручной one-shot для `watchtower`:

```bash
docker login registry.smart-home-pnz.ru
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/.docker/config.json:/config.json:ro \
  containrrr/watchtower \
  --run-once --cleanup
```

## Документация
- `docs/README.md`
- `docs/ARCHITECTURE.md`
- `docs/OPERATIONS.md`
- `docs/DEPLOY_LOCAL_SERVER.md`