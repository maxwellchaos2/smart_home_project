import 'dart:io';

/// Результат поиска аудиоустройства
class AudioDeviceInfo {
  final String cardId;
  final String deviceId;
  final String name;
  final String fullPath;

  AudioDeviceInfo({
    required this.cardId,
    required this.deviceId,
    required this.name,
    required this.fullPath,
  });

  /// Возвращает строку вида "1,0" для использования как audioId
  String get audioId => '$cardId,$deviceId';

  @override
  String toString() => 'AudioDevice(id=$audioId, name=$name, path=$fullPath)';
}

/// Класс для автоматического обнаружения аудиоустройств
class AudioDeviceDetector {
  /// Выполняет `aplay -l` и парсит вывод для поиска устройства
  /// Ищет устройство с именем содержащим [searchPattern] (по умолчанию "USB PnP Sound Device")
  static Future<AudioDeviceInfo?> detectDevice({
    String searchPattern = 'USB PnP Sound Device',
  }) async {
    try {
      print('🔍 Ищу аудиоустройство с названием "$searchPattern"...');

      final result = await Process.run('aplay', ['-l']);

      if (result.exitCode != 0) {
        final stderr = (result.stderr ?? '').toString().trim();
        print(
            '⚠️  aplay -l завершился с кодом ${result.exitCode}. stderr: $stderr');
        return null;
      }

      final output = (result.stdout ?? '').toString().trim();
      if (output.isEmpty) {
        print('⚠️  aplay -l вернул пустой вывод.');
        return null;
      }

      print('📋 Доступные устройства воспроизведения:');
      print(output);

      return parseAplayOutput(output, searchPattern);
    } catch (e) {
      print('❌ Ошибка при поиске устройства: $e');
      return null;
    }
  }

  /// Парсит вывод aplay -l для поиска нужного устройства
  /// Формат вывода aplay -l:
  /// card 0: PCH [HDA Intel PCH], device 0: ALC887-VD Analog [ALC887-VD Analog]
  /// card 3: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  static AudioDeviceInfo? parseAplayOutput(
    String output,
    String searchPattern,
  ) {
    final lines = output.split('\n');

    for (final line in lines) {
      // Пропускаем пустые строки и строки без нужного паттерна
      if (!line.contains(searchPattern)) continue;

      // Парсим строку типа:
      // card 3: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
      final cardMatch = RegExp(r'card (\d+):').firstMatch(line);
      final deviceMatch = RegExp(r'device (\d+):').firstMatch(line);

      if (cardMatch == null || deviceMatch == null) continue;

      final cardId = cardMatch.group(1);
      final deviceId = deviceMatch.group(1);

      if (cardId == null || deviceId == null) continue;

      final device = AudioDeviceInfo(
        cardId: cardId,
        deviceId: deviceId,
        name: searchPattern,
        fullPath: 'hw:$cardId,$deviceId',
      );

      print('✅ Найдено устройство: $device');
      return device;
    }

    print('❌ Устройство "$searchPattern" не найдено в доступных устройствах');
    return null;
  }

  /// Получает все доступные устройства воспроизведения
  static Future<List<AudioDeviceInfo>> listAllDevices() async {
    try {
      final result = await Process.run('aplay', ['-l']);

      if (result.exitCode != 0) {
        print('⚠️  aplay -l вернул ошибку');
        return [];
      }

      final output = (result.stdout ?? '').toString().trim();
      if (output.isEmpty) {
        return [];
      }

      return parseAllDevices(output);
    } catch (e) {
      print('❌ Ошибка при получении списка устройств: $e');
      return [];
    }
  }

  /// Парсит вывод aplay -l и возвращает все устройства
  static List<AudioDeviceInfo> parseAllDevices(String output) {
    final devices = <AudioDeviceInfo>[];
    final lines = output.split('\n');

    for (final line in lines) {
      final cardMatch = RegExp(r'card (\d+):\s*(.+?)\s*\[').firstMatch(line);
      final deviceMatch =
          RegExp(r'device (\d+):\s*(.+?)\s*\[').firstMatch(line);

      if (cardMatch == null || deviceMatch == null) continue;

      final cardId = cardMatch.group(1);
      final deviceId = deviceMatch.group(1);
      final cardName = cardMatch.group(2)?.trim() ?? 'Unknown';
      final deviceName = deviceMatch.group(2)?.trim() ?? 'Unknown';

      if (cardId == null || deviceId == null) continue;

      devices.add(AudioDeviceInfo(
        cardId: cardId,
        deviceId: deviceId,
        name: '$cardName - $deviceName',
        fullPath: 'hw:$cardId,$deviceId',
      ));
    }

    return devices;
  }
}
