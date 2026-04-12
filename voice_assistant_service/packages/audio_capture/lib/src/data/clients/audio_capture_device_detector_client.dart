import 'dart:io';

import 'package:audio_capture/src/domain/domain.dart';

abstract interface class IAudioCaptureDeviceDetectorClient {
  Future<List<AudioCaptureDeviceEntity>> getAvailableDevices();
}

class AudioCaptureDeviceDetectorClientImpl
    implements IAudioCaptureDeviceDetectorClient {
  /// Получает список доступных аудио устройств в зависимости от платформы
  Future<List<AudioCaptureDeviceEntity>> getAvailableDevices() async {
    if (Platform.isLinux) {
      return await _getLinuxDevices();
    } else if (Platform.isMacOS) {
      return await _getMacDevices();
    } else {
      return [];
    }
  }

  /// Получает устройства Linux (ALSA)
  Future<List<AudioCaptureDeviceEntity>> _getLinuxDevices() async {
    final devices = <AudioCaptureDeviceEntity>[];

    try {
      // Получаем список ALSA карт
      final result = await Process.run('arecord', ['-l']);
      if (result.exitCode == 0) {
        final lines = result.stdout.toString().split('\n');
        for (final line in lines) {
          // Парсим строки вида: "card 3: AC200Audio [AC200 Audio], device 0: 3003400.i2s-ac200 (*) []"
          final match = RegExp(r'card (\d+): (\w+) \[([^\]]+)\], device (\d+)')
              .firstMatch(line);
          if (match != null) {
            final cardId = match.group(1)!;
            final deviceId = match.group(4)!;
            final name = match.group(3)!;
            // if (name == 'ac200-audio') {
            //   continue; // Пропускаем встроенное устройство ac200-audio
            // }

            devices.add(AudioCaptureDeviceEntity(
              cardId: cardId,
              deviceId: deviceId,
              name: name,
              description: line.trim(),
            ));
          }
        }
      }
    } catch (e) {
      print("❌ Ошибка получения ALSA устройств: $e");
    }

    return devices;
  }

  /// Получает устройства Mac (AVFoundation)
  Future<List<AudioCaptureDeviceEntity>> _getMacDevices() async {
    final devices = <AudioCaptureDeviceEntity>[];

    try {
      // Пробуем ffmpeg для получения списка устройств
      final result = await Process.run(
          'ffmpeg', ['-f', 'avfoundation', '-list_devices', 'true', '-i', '']);

      // FFmpeg выводит в stderr
      final lines = result.stderr.toString().split('\n');

      for (final line in lines) {
        // Парсим строки вида: "[AVFoundation indev @ 0x...] [0] Микрофон MacBook Pro"
        if (line.contains('AVFoundation') && line.contains('] [')) {
          final match = RegExp(r'\[(\d+)\] (.+)$').firstMatch(line);
          if (match != null) {
            final index = match.group(1)!;
            final name = match.group(2)!.trim();

            devices.add(AudioCaptureDeviceEntity(
              cardId: index,
              deviceId: index,
              name: name,
              description: line.trim(),
            ));
          }
        }
      }
    } catch (e) {
      print("❌ Ошибка получения Mac устройств: $e");

      // Добавляем устройство по умолчанию
      devices.add(AudioCaptureDeviceEntity(
        cardId: '0',
        deviceId: '0',
        name: 'Default Microphone',
        description: 'System default microphone',
      ));
    }

    return devices;
  }
}
