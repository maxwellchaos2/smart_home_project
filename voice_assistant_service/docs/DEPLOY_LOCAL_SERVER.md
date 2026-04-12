# Deploy on Local Server (Ubuntu 20+ / Raspberry Pi)

Сценарий: образ собирается на рабочей машине, на Raspberry Pi запускается контейнер в составе общего Docker Compose.

## 1. Важная зависимость
Для работы распознавания речи **обязательно** должен быть запущен `vosk-server` в том же Docker Compose.

Также обязательны:
- `sync_service`
- `rhvoice-server`

## 2. Предусловия
- Raspberry Pi (arm64) / Ubuntu 20+.
- Docker на целевой машине.
- На сборочной машине есть `.github_token` для приватных зависимостей при сборке.

## 3. Сборка image на рабочей машине

```bash
cd <path-to-repo>/voice_assistant_service
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token --platform linux/arm64 -t voice_assistant_service:latest .
```

## 4. Передача image на Raspberry Pi

### Вариант A: registry

```bash
docker tag voice_assistant_service:latest <registry>/voice_assistant_service:latest
docker push <registry>/voice_assistant_service:latest
```

На малинке:

```bash
docker pull <registry>/voice_assistant_service:latest
```

### Вариант B: tar

На рабочей машине:

```bash
docker save voice_assistant_service:latest -o voice_assistant_service_latest.tar
scp voice_assistant_service_latest.tar <user>@<raspberry-ip>:~
```

На малинке:

```bash
docker load -i ~/voice_assistant_service_latest.tar
rm -f ~/voice_assistant_service_latest.tar
```

## 5. env для voice_assistant_service

```bash
cat > ~/voice_assistant_service.env << 'EOF'
SYNC_SERVICE_URL=http://sync_service:8080
VOSK_URL=ws://vosk-server:2700
RHVOICE_URL=http://rhvoice-server:2800
AUDIO_ID=1,0
EOF
```

## 6. Compose требования

В `local_service/compose.yaml` должно быть:
- `depends_on` у `voice_assistant_service` включает `sync_service`, `rhvoice-server`, `vosk-server`;
- переменные `SYNC_SERVICE_URL`, `VOSK_URL`, `RHVOICE_URL` передаются в контейнер;
- проброс `devices: /dev/snd:/dev/snd`;
- `vosk-server` и `rhvoice-server` подключены к той же сети (`app-network`).

## 7. Запуск и проверка

```bash
docker compose up -d voice_assistant_service vosk-server rhvoice-server
docker compose logs -f voice_assistant_service
```

Проверки:
- Vosk доступен: `ws://vosk-server:2700` внутри compose;
- RHVoice доступен: `http://rhvoice-server:2800/voices`;
- в логах `voice_assistant_service` нет ошибок ALSA и WebSocket к Vosk.

## 8. Обновление

```bash
docker compose pull voice_assistant_service
docker compose up -d voice_assistant_service
docker compose logs -f voice_assistant_service
```
