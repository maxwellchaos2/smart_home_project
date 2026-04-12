# Voice Assistant Architecture

## 1. Поток обработки голоса
1. **Audio Capture** получает PCM поток с микрофонов (`DeviceType.microphone`).
2. **STT (Vosk)** отправляет аудио по WebSocket в `VOSK_URL`.
3. **Command Parser** распознает команду и целевое устройство/действие.
4. **Action Dispatch** вызывает `needChangeDevicesCapabilities` через sync/devices слой.
5. **Voice Response** воспроизводит предзаписанные фразы и/или RHVoice TTS.

## 2. Архитектурные блоки
- **Audio Layer**: `audio_capture`, `VoiceRecorder`, `ChunkedVoiceRecorder`, `AudioDeviceDetector`.
- **STT Layer**: `VoskClient` (`lib/src/vosk_client.dart`) для стриминга распознавания.
- **Command Layer**: `command_parser` для преобразования текста в actions.
- **Device/Event Layer**: `DevicesModule` + `EventsModule`, работа через `SYNC_SERVICE_URL`.
- **TTS/Playback Layer**:
	- `SavedVoiceClient` (готовые wav из `/app/voices`),
	- `RhvoiceClient` (HTTP в `RHVOICE_URL`),
	- `VoicePlayer` (ALSA playback).

## 3. Ключевые качества
- Низкая end-to-end задержка на типовых командах.
- Стабильность распознавания на шумном фоне.
- Безопасная обработка аудиоданных и персональных данных.

## 4. Сетевые зависимости в edge-контуре
- `voice_assistant_service -> sync_service` по `SYNC_SERVICE_URL`.
- `voice_assistant_service -> vosk-server` по `VOSK_URL`.
- `voice_assistant_service -> rhvoice-server` по `RHVOICE_URL`.

Все три сервиса должны быть в одной compose-сети (`app-network`).
