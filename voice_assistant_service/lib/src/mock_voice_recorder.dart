import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class MockVoiceRecorder {
  final StreamController<Uint8List> _audioStreamController =
      StreamController<Uint8List>();
  Stream<Uint8List> get audioStream => _audioStreamController.stream;

  Timer? _timer;
  late File _wavFile;
  late RandomAccessFile _fileAccess;
  int _position = 44; // Пропускаем WAV заголовок (44 байта)

  Future<void> startRecording() async {
    // Укажите путь к вашему тестовому WAV файлу
    final wavPath = Platform.environment['TEST_WAV_FILE'] ?? 'test.wav';
    _wavFile = File(wavPath);

    if (!await _wavFile.exists()) {
      print("❌ WAV файл не найден: $wavPath");
      print(
          "💡 Создайте тестовый файл: arecord -D plughw:3,0 -f S16_LE -r 16000 -c 1 -d 10 test.wav");
      return;
    }

    print("🎵 Читаем из WAV файла: $wavPath");
    _fileAccess = await _wavFile.open();

    // Читаем данные чанками по 1600 байт (100ms при 16kHz моно)
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) async {
      await _readNextChunk();
    });
  }

  Future<void> _readNextChunk() async {
    try {
      await _fileAccess.setPosition(_position);
      final chunk = await _fileAccess.read(3200); // 100ms аудио = 1600 байт

      if (chunk.isEmpty) {
        // Файл закончился - начинаем сначала (зацикливание)
        _position = 44;
        print("🔄 WAV файл закончился, начинаем сначала");
        return;
      }

      _position += chunk.length;
      _audioStreamController.add(Uint8List.fromList(chunk));
    } catch (e) {
      print("❌ Ошибка чтения WAV: $e");
    }
  }

  Future<void> dispose() async {
    _timer?.cancel();
    await _fileAccess.close();
    await _audioStreamController.close();
  }
}
