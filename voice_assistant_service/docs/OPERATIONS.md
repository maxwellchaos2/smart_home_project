# Voice Assistant Operations

## 1. Подготовка
- Убедиться, что в compose подняты: `sync_service`, `vosk-server`, `rhvoice-server`.
- Создать `.env` из шаблона.
- Проверить доступ к ALSA устройствам (`/dev/snd`) и корректный `AUDIO_ID` (или автоопределение).

```bash
cp .env.example .env
```

## 2. Запуск
- Обычно запуск через общий Docker Compose на малинке.
- Для локальной отладки можно запускать через Dart.

Локальный запуск Dart:

```bash
dart pub get
set -a
source .env
set +a
dart run bin/server.dart
```

Сборка Docker image:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t voice_assistant_service:latest .
```

## 3. Мониторинг качества
- Word error rate/intent accuracy по контрольному набору.
- p95 задержки по цепочке audio→action.
- Доля fallback-ответов и повторных запросов пользователю.

Операционные метрики:
- доступность `vosk-server` (`ws://...:2700`);
- доступность `rhvoice-server` (`http://...:2800/voices`);
- количество ошибок ALSA/capture в логах `voice_assistant_service`.

## 4. Инциденты
- **Не распознает голос**:
	- проверить `VOSK_URL`;
	- проверить, что `vosk-server` запущен в compose;
	- проверить качество/частоту аудио потока.
- **Нет озвучки ответов**:
	- проверить `RHVOICE_URL` и доступность `rhvoice-server`;
	- проверить ALSA playback устройства.
- **Команды не влияют на устройства**:
	- проверить `SYNC_SERVICE_URL` и доступность `sync_service`;
	- проверить, что события `needChangeDevicesCapabilities` проходят по pipeline.

