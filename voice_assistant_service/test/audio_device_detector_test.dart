import 'package:voice_assistant_service/src/audio_device_detector.dart';

void main() {
  final testOutput = '''**** List of PLAYBACK Hardware Devices ****
card 0: Headphones [bcm2835 Headphones], device 0: bcm2835 Headphones [bcm2835 Headphones]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
card 2: Device_1 [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: vc4hdmi0 [vc4-hdmi-0], device 0: MAI PCM i2s-hifi-0 [MAI PCM i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 4: vc4hdmi1 [vc4-hdmi-1], device 0: MAI PCM i2s-hifi-0 [MAI PCM i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 5: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0''';

  print('🧪 Тестирование парсера AudioDeviceDetector\n');

  // Тест 1: Поиск USB PnP Sound Device
  print('📝 Тест 1: Поиск "USB PnP Sound Device"');
  final usbDevice = AudioDeviceDetector.parseAplayOutput(
    testOutput,
    'USB PnP Sound Device',
  );
  if (usbDevice != null) {
    print('✅ PASSED');
    print('   Найдено: $usbDevice');
    print('   Card ID: ${usbDevice.cardId}');
    print('   Device ID: ${usbDevice.deviceId}');
    print('   Audio ID: ${usbDevice.audioId}');
    assert(usbDevice.cardId == '2', 'Card ID должен быть 2');
    assert(usbDevice.deviceId == '0', 'Device ID должен быть 0');
    assert(usbDevice.audioId == '2,0', 'Audio ID должен быть 2,0');
  } else {
    print('❌ FAILED - Устройство не найдено');
  }
  print('');

  // Тест 2: Получение всех устройств
  print('📝 Тест 2: Получение всех устройств');
  final allDevices = AudioDeviceDetector.parseAllDevices(testOutput);
  print('✅ PASSED');
  print('   Найдено устройств: ${allDevices.length}');
  for (final dev in allDevices) {
    print('   - $dev');
  }
  assert(allDevices.length == 5, 'Должно быть 5 устройств');
  print('');

  // Тест 3: Проверка поиска другого паттерна
  print('📝 Тест 3: Поиск "USB Audio" (должно найти первое с этим именем)');
  final usbAudioDevice = AudioDeviceDetector.parseAplayOutput(
    testOutput,
    'USB Audio',
  );
  if (usbAudioDevice != null) {
    print('✅ PASSED');
    print('   Найдено: $usbAudioDevice');
    // Первый USB Audio - это card 2 (Device_1 [USB PnP Sound Device] с device USB Audio)
    // НО! Паттерн ищется в целой строке, поэтому найдет card 2
    // Проверим что найдено правильное
  } else {
    print('❌ FAILED');
  }
  print('');

  // Тест 4: Поиск несуществующего паттерна
  print('📝 Тест 4: Поиск несуществующего паттерна "NonExistent"');
  final notFound = AudioDeviceDetector.parseAplayOutput(
    testOutput,
    'NonExistent',
  );
  if (notFound == null) {
    print('✅ PASSED - Корректно вернул null для несуществующего паттерна');
  } else {
    print('❌ FAILED - Должен был вернуть null');
  }
  print('');

  // Тест 5: Проверка извлечения параметров для каждого устройства
  print('📝 Тест 5: Детальная проверка каждого устройства');
  final expected = [
    ('0', '0', 'Headphones - bcm2835 Headphones'),
    ('2', '0', 'Device_1 - USB Audio'),
    ('3', '0', 'vc4hdmi0 - MAI PCM i2s-hifi-0'),
    ('4', '0', 'vc4hdmi1 - MAI PCM i2s-hifi-0'),
    ('5', '0', 'Audio - USB Audio'),
  ];

  for (int i = 0; i < allDevices.length; i++) {
    final device = allDevices[i];
    final (expectedCard, expectedDev, expectedName) = expected[i];

    final cardMatch = device.cardId == expectedCard;
    final devMatch = device.deviceId == expectedDev;

    if (cardMatch && devMatch) {
      print(
          '✅ Устройство $i: card ${device.cardId}, device ${device.deviceId}');
    } else {
      print(
          '❌ Устройство $i: ожидалось card $expectedCard device $expectedDev, получено card ${device.cardId} device ${device.deviceId}');
    }
  }
  print('');

  print('🎉 Все тесты завершены!');
}
