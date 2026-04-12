import 'dart:async';
import 'dart:io';

class ButtonResetService {
  final int gpioPin;
  final Duration holdDuration;
  final Duration debounceDuration;
  final StreamController<void> _controller = StreamController<void>.broadcast();

  Timer? _pressTimer;
  Timer? _debounceTimer;
  bool _isPressed = false;
  Process? _process;

  Stream<void> get onResetPressed => _controller.stream;

  ButtonResetService({
    this.gpioPin = 21,
    this.holdDuration = const Duration(seconds: 5),
    this.debounceDuration = const Duration(milliseconds: 50),
  });

  Future<void> start() async {
    print('Ожидание нажатия кнопки на GPIO$gpioPin...');

    // Запускаем периодическую проверку состояния кнопки
    Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        final isPressed = await _readGpioState();
        _handleButtonState(isPressed);
      } catch (e) {
        print('Ошибка чтения GPIO: $e');
      }
    });
  }

  /// Чтение состояния GPIO пина
  Future<bool> _readGpioState() async {
    try {
      // Метод 2: Чтение через gpioget
      final result = await Process.run('gpioget', ['gpiochip0', '$gpioPin']);
      if (result.exitCode == 0) {
        return result.stdout.toString().trim() ==
            '0'; // 0 = нажата (при pull-up)
      }

      throw Exception('Не удалось прочитать состояние GPIO$gpioPin');
    } catch (e) {
      throw Exception('Ошибка чтения GPIO$gpioPin: $e');
    }
  }

  /// Обработка состояния кнопки
  void _handleButtonState(bool isPressed) {
    // print('GPIO$gpioPin состояние: ${isPressed ? "нажата" : "отпущена"}');

    if (isPressed && !_isPressed) {
      // Кнопка только что нажалась
      _onPressed();
    } else if (!isPressed && _isPressed) {
      // Кнопка только что отпустилась
      _onReleased();
    }
    // Если состояние не изменилось - ничего не делаем
  }

  void _onPressed() {
    if (!_isPressed) {
      _isPressed = true;
      print(
          'Кнопка нажата! Удерживайте ${holdDuration.inSeconds} секунд для сброса...');

      _pressTimer = Timer(holdDuration, () {
        if (_isPressed) {
          print(
              'Кнопка удерживалась ${holdDuration.inSeconds} секунд - выполняется сброс!');
          _controller.add(null);
        }
      });
    }
  }

  void _onReleased() {
    if (_isPressed) {
      _isPressed = false;
      print('Кнопка отпущена');
      _pressTimer?.cancel();
      _pressTimer = null;
    }
  }

  void dispose() {
    _pressTimer?.cancel();
    _debounceTimer?.cancel();
    _controller.close();
    _process?.kill();
  }
}
