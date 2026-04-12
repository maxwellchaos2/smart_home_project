# Voice Assistant Service Documentation

## 1. Назначение
`voice_assistant_service` реализует голосовое управление Smart Home на локальном хабе (Raspberry Pi).

Практический контур:
- сервис запускается в одном Docker Compose с `sync_service`;
- распознавание речи выполняется через Vosk (`vosk-server`);
- озвучка ответов выполняется через RHVoice (`rhvoice-server`);
- команды изменения устройств уходят в платформу через `sync_service`.

## 2. Ответственность
- Захват аудио с микрофонов и потоковая передача в Vosk.
- Разбор голосовых команд (вкл/выкл, управление диапазонами, запрос температуры и др.).
- Отправка команд управления устройствами в events/devices слой через `sync_service`.
- Воспроизведение голосового ответа (предзаписанные фразы + RHVoice TTS).
- Автоопределение аудиоустройства воспроизведения и управление несколькими capture-устройствами.

## 3. Документация
- `docs/README.md` — обзор voice контура в локальном edge.
- `docs/ARCHITECTURE.md` — runtime-пайплайн аудио и событий.
- `docs/OPERATIONS.md` — эксплуатация, диагностика и настройки.
- `docs/DEPLOY_LOCAL_SERVER.md` — деплой на Ubuntu 20+/Raspberry Pi.

## 4. Обязательные зависимости в compose
- `sync_service` — обязателен (events/devices API).
- `vosk-server` — обязателен для STT (распознавания речи).
- `rhvoice-server` — обязателен для TTS ответа.

Важно: `vosk-server` должен быть поднят в том же Docker Compose и доступен по `VOSK_URL`.

## 5. Переменные окружения
- `SYNC_SERVICE_URL` (обычно `http://sync_service:8080`)
- `VOSK_URL` (обычно `ws://vosk-server:2700`)
- `RHVOICE_URL` (обычно `http://rhvoice-server:2800`)
- `AUDIO_ID` (опционально; при отсутствии используется автоопределение)

