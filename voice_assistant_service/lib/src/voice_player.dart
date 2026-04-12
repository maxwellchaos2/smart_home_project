import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class VoicePlayer {
  final String audioCardId;
  final String deviceId;

  VoicePlayer({this.audioCardId = '0', this.deviceId = '0'});

  Process? _playProcess;
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  Future<void> play({required Stream<Uint8List> audioStream}) async {
    // 🔧 ИСПРАВЛЕНИЕ: Всегда останавливаем предыдущий процесс
    await _stopPlaying();

    try {
      // 🔧 Создаем НОВЫЙ процесс каждый раз
      await _startNewPlaybackProcess();

      if (_playProcess == null) {
        throw Exception("Не удалось запустить процесс воспроизведения");
      }

      // Подписываемся на поток ПОСЛЕ создания процесса
      audioStream.listen(
        (data) {
          if (_isPlaying && _playProcess != null && data.isNotEmpty) {
            try {
              _playProcess!.stdin.add(data);
            } catch (e) {
              print("❌ Ошибка отправки данных: $e");
            }
          }
        },
        onError: (e) async {
          print("❌ Ошибка в аудио потоке: $e");
          await _stopPlaying();
        },
        onDone: () async {
          print("🎵 Поток аудио завершен, закрываю stdin...");
          await _finishPlayback();
        },
        cancelOnError: true,
      );

      print(
          "✅ Воспроизведение началось с устройства plughw:$audioCardId,$deviceId");
    } catch (e) {
      print("❌ Ошибка запуска воспроизведения: $e");
      _isPlaying = false;
      rethrow;
    }
  }

  /// Создает новый процесс aplay
  Future<void> _startNewPlaybackProcess() async {
    String command;
    List<String> args;

    if (Platform.isLinux) {
      command = 'aplay';
      args = [
        '-D', 'plughw:$audioCardId,$deviceId',
        '-', // Читаем из stdin
      ];
    } else if (Platform.isMacOS) {
      command = 'afplay';
      args = ['-'];
    } else {
      throw UnsupportedError(
          'Платформа не поддерживается: ${Platform.operatingSystem}');
    }

    print("🎙️  Запуск нового процесса: $command ${args.join(' ')}");

    _playProcess = await Process.start(command, args);
    _isPlaying = true;

    // 🔧 Слушаем завершение процесса
    _playProcess!.exitCode.then((exitCode) {
      print("🛑 Процесс aplay завершен (код: $exitCode)");
      _isPlaying = false;
      _playProcess = null;
    }).catchError((error) {
      print("❌ Ошибка процесса aplay: $error");
      _isPlaying = false;
      _playProcess = null;
    });

    // Слушаем ошибки stderr
    _playProcess!.stderr.listen((data) {
      final error = String.fromCharCodes(data).trim();
      if (error.isNotEmpty && !error.contains('underrun')) {
        print("⚠️  aplay stderr: $error");
      }
    });

    // 🔧 НЕ слушаем stdout - aplay его не использует для аудио
  }

  /// Завершает воспроизведение корректно
  Future<void> _finishPlayback() async {
    if (_playProcess != null && _isPlaying) {
      try {
        // Закрываем stdin чтобы aplay завершился естественно
        await _playProcess!.stdin.close();
        print("✅ stdin закрыт, ждем завершения процесса...");

        // Ждем завершения процесса с таймаутом
        final exitCode = await _playProcess!.exitCode.timeout(
          Duration(seconds: 5),
          onTimeout: () {
            print("⏰ Таймаут ожидания, принудительное завершение");
            _playProcess!.kill(ProcessSignal.sigkill);
            return -1;
          },
        );

        print("🛑 Воспроизведение завершено (код: $exitCode)");
      } catch (e) {
        print("⚠️  Ошибка при завершении: $e");
      } finally {
        _isPlaying = false;
        _playProcess = null;
      }
    }
  }

  /// Принудительная остановка
  Future<void> _stopPlaying() async {
    if (_playProcess != null) {
      try {
        print("🛑 Останавливаю текущее воспроизведение...");

        // Сначала мягко
        _playProcess!.kill(ProcessSignal.sigterm);

        // Ждем завершения с таймаутом
        await _playProcess!.exitCode.timeout(
          Duration(seconds: 2),
          onTimeout: () {
            // Если не завершился - убиваем жестко
            _playProcess!.kill(ProcessSignal.sigkill);
            return -1;
          },
        );
      } catch (e) {
        print("⚠️  Ошибка при остановке: $e");
      } finally {
        _isPlaying = false;
        _playProcess = null;
      }
    }
  }

  Future<void> dispose() async {
    await _stopPlaying();
  }
}
