import 'dart:async';
import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:dart_snap7/dart_snap7.dart';
import 'package:synchronized/synchronized.dart';

part 'logo_controller_service.freezed.dart';

class LogoControllerService {
  late final AsyncClient client;

  LogoControllerService({
    this.outputCount = 8,
    this.inputCount = 8,
  });

  final int outputCount;
  final int inputCount;

  late final StreamController<List<OutputDevice>> outputsController =
      StreamController<List<OutputDevice>>.broadcast();

  late final StreamController<OutputDevice> outputChangeController =
      StreamController<OutputDevice>.broadcast();

  Stream<List<OutputDevice>> get outputsStream => outputsController.stream;

  Stream<OutputDevice> get outputChangeStream => outputChangeController.stream;

  late final Lock _lock = Lock();

  Future<void> connect({
    required String plcIp,
    int rack = 0,
    int slot = 2,
    String? libraryPath,
  }) async {
    client = AsyncClient();
    await client.init(libraryPath);
    while (true) {
      try {
        await client.connect(plcIp, rack, slot);
        await _startListenOutputs();
      } catch (e) {
        print(e);
        await client.disconnect();
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  List<OutputDevice> _lastOutputs = [];

  List<Function> _tickListeners = [];

  void addTickListener(Function listener) {
    _tickListeners.add(listener);
  }

  Future<void> _startListenOutputs() async {
    while (true) {
      await _lock.synchronized(
        () async {
          final outputs = await readOutputs();
          for (final listener in _tickListeners) {
            listener();
          }

          bool isChanged = false;
          if (!_lastOutputs.isEmpty) {
            for (final (i, output) in outputs.indexed) {
              if (output != _lastOutputs[i]) {
                outputChangeController.add(output);
                isChanged = true;
              }
            }
          }
          if (isChanged) outputsController.add(outputs);
          _lastOutputs = outputs;
        },
        timeout: Duration(seconds: 5),
      );
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  /// Записывает значение бита в Data Block
  Future<void> writeNI(int vbNumber, bool state) async {
    // Читаем 10 байт из DB1, начиная с vbNumber
    await _lock.synchronized(
      () async {
        final data = await client.readDataBlock(1, vbNumber, inputCount);
        final bytes = ByteData.view(data.buffer);

        // Получаем текущий байт и устанавливаем бит 0
        final currentByte = bytes.getUint8(0);
        final currentValue = currentByte.getBit(0);

        // нужно включить, перед тем как выключить
        if (state == false && currentValue == false) {
          final meker = await readMeker(vbNumber);
          if (meker == false) {
            return;
          }

          final offByte = currentByte.setBit(0, true);
          final offData = Uint8List(inputCount);
          offData.setAll(0, data);
          offData[0] = offByte;
          await client.writeDataBlock(1, vbNumber, offData);
        } else if (state == true && currentValue == true) {
          final meker = await readMeker(vbNumber);
          if (meker == false) {
            return;
          }
          // нужно выключить, перед тем как включить
          final offByte = currentByte.setBit(0, false);
          final offData = Uint8List(inputCount);
          offData.setAll(0, data);
          offData[0] = offByte;
          await client.writeDataBlock(1, vbNumber, offData);
        }

        final newByte = currentByte.setBit(0, state);

        // Записываем изменённый байт обратно
        final writeData = Uint8List(inputCount);
        writeData.setAll(0, data);
        writeData[0] = newByte;

        await client.writeDataBlock(1, vbNumber, writeData);
        print('VB$vbNumber.Bit0 => $state');
      },
      timeout: Duration(seconds: 5),
    );
  }

  /// Читает значение бита из Data Block
  Future<bool> readNI(int vbNumber) async {
    // Читаем 10 байт из DB1, начиная с vbNumber
    final data = await client.readDataBlock(1, vbNumber, inputCount);
    final bytes = ByteData.view(data.buffer);

    // Получаем байт и извлекаем бит 0
    final byte = bytes.getUint8(0);
    return byte.getBit(0);
  }

  Future<List<OutputDevice>> readOutputs() async {
    final data = await client.readOutputs(0, outputCount);
    final bytes = ByteData.view(data.buffer);

    // Аналогично Python: get_bool(data, 0, i) - читаем биты 0-7 из байта 0
    final byte0 = bytes.getUint8(0);
    return List.generate(outputCount, (i) {
      return OutputDevice(id: i, state: byte0.getBit(i));
    });
  }

  Future<bool> readMeker(int vbNumber) async {
    final data = await client.readMerkers(0, outputCount);
    final bytes = ByteData.view(data.buffer);

    final byte0 = bytes.getUint8(0);
    return byte0.getBit(vbNumber);
  }
}

extension BitMap on int {
  bool getBit(int pos) {
    final x = this >> pos;
    return x & 1 == 1;
  }

  int setBit(int pos, bool bit) {
    final x = 1 << pos;
    if (bit) {
      return this | x;
    }

    return getBit(pos) ? this ^ x : this;
  }
}

@freezed
sealed class OutputDevice with _$OutputDevice {
  const factory OutputDevice({
    required int id,
    required bool state,
  }) = _OutputDevice;
}
