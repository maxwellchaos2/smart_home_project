import 'dart:io';
import 'dart:typed_data';

/// Просто читает заготовленные голосовые файлы из папки voices
class SavedVoiceClient {
  Stream<Uint8List> synthesize(
    VoiceText text, {
    Voice voice = Voice.kuzya,
    int volume = 100,
    int chunkSize = 4096,
  }) async* {
    final randomFileNames = VoiceTextMapper.toFileName(voice: voice, from: text)
        .toList()
      ..shuffle();
    final fileName = '/app/voices/${voice.name}/${randomFileNames.first}';
    final file = File(fileName);
    if (await file.exists()) {
      final fileStream = file.openRead();
      await for (final chunk in fileStream) {
        yield Uint8List.fromList(chunk);
      }
    } else {
      throw Exception("Voice file not found: $fileName");
    }
  }
}

enum Voice {
  putin,
  kuzya,
}

enum VoiceText {
  done,
  undone,
  lightOn,
  lightOff,

  temp16,
  temp17,
  temp18,
  temp19,
  temp20,
  temp21,
  temp22,
  temp23,
  temp24,
  temp25,
  temp26,
  temp27,
  temp28,
  temp29,
  temp30,
}

abstract final class VoiceTextMapper {
  static List<String> toFileName(
      {required Voice voice, required VoiceText from}) {
    return switch (voice) {
      Voice.putin => switch (from) {
          VoiceText.undone => [
              'putin-done-1.wav', // TODO
            ],
          VoiceText.done => [
              'putin-done-1.wav',
              'putin-done-2.wav',
              'putin-done-3.wav',
            ],
          VoiceText.lightOn => [
              'putin-light-on-1.wav',
              'putin-light-on-1.wav',
              ...toFileName(voice: voice, from: VoiceText.done)
            ],
          VoiceText.lightOff => [
              'putin-light-off-1.wav',
              'putin-light-off-1.wav',
              'putin-light-off-2.wav',
              'putin-light-off-2.wav',
              ...toFileName(voice: voice, from: VoiceText.done)
            ],
          VoiceText.temp16 => ['putin-16-temp.wav'],
          VoiceText.temp17 => ['putin-17-temp.wav'],
          VoiceText.temp18 => ['putin-18-temp.wav'],
          VoiceText.temp19 => ['putin-19-temp.wav'],
          VoiceText.temp20 => ['putin-20-temp.wav'],
          VoiceText.temp21 => ['putin-21-temp.wav'],
          VoiceText.temp22 => ['putin-22-temp.wav'],
          VoiceText.temp23 => ['putin-23-temp.wav'],
          VoiceText.temp24 => ['putin-24-temp.wav'],
          VoiceText.temp25 => ['putin-25-temp.wav'],
          VoiceText.temp26 => ['putin-26-temp.wav'],
          VoiceText.temp27 => ['putin-27-temp.wav'],
          VoiceText.temp28 => ['putin-28-temp.wav'],
          VoiceText.temp29 => ['putin-29-temp.wav'],
          VoiceText.temp30 => ['putin-30-temp.wav'],
        },
      Voice.kuzya => switch (from) {
          VoiceText.undone => [
              'undone-1.wav',
              'undone-2.wav',
              'undone-3.wav',
              'undone-4.wav',
            ],
          VoiceText.done => [
              'done-1.wav',
              'done-2.wav',
              'done-3.wav',
              'done-4.wav',
              'done-5.wav',
              'done-6.wav',
              'done-7.wav',
              'done-8.wav',
              'done-9.wav',
              'done-10.wav',
            ],
          VoiceText.lightOn => [
              'light-on-1.wav',
              'light-on-1.wav',
              'light-on-2.wav',
              'light-on-2.wav',
              ...toFileName(voice: voice, from: VoiceText.done)
            ],
          VoiceText.lightOff => [
              'light-off-1.wav',
              'light-off-1.wav',
              'light-off-2.wav',
              'light-off-2.wav',
              ...toFileName(voice: voice, from: VoiceText.done)
            ],
          VoiceText.temp16 => ['temp-16.wav'],
          VoiceText.temp17 => ['temp-17.wav'],
          VoiceText.temp18 => ['temp-18.wav'],
          VoiceText.temp19 => ['temp-19.wav'],
          VoiceText.temp20 => ['temp-20.wav'],
          VoiceText.temp21 => ['temp-21.wav'],
          VoiceText.temp22 => ['temp-22.wav'],
          VoiceText.temp23 => ['temp-23.wav'],
          VoiceText.temp24 => ['temp-24.wav'],
          VoiceText.temp25 => ['temp-25.wav'],
          VoiceText.temp26 => ['temp-26.wav'],
          VoiceText.temp27 => ['temp-27.wav'],
          VoiceText.temp28 => ['temp-28.wav'],
          VoiceText.temp29 => ['temp-29.wav'],
          VoiceText.temp30 => ['temp-30.wav'],
        },
      _ => throw Exception('Voice not supported: $voice'),
    };
  }
}
