import 'package:command_parser/command_parser.dart';
import 'package:devices/devices.dart';
import 'package:test/test.dart';

void main() {
  group('Тесты на парсинг команд', () {
    late Map<String, DeviceEntity> testDevices;
    late CommandParser commandParser;

    setUp(() {
      final now = DateTime.now();
      // Создаем тестовые устройства
      testDevices = {
        'лампа 1': DeviceEntity(
          id: 1,
          providerDeviceId: 'lamp1',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.light,
          inputId: null,
          outputId: null,
          name: 'лампа 1',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 1,
          floorId: 1,
          projectId: 1,
        ),
        'лампа 2': DeviceEntity(
          id: 2,
          providerDeviceId: 'lamp2',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.light,
          inputId: null,
          outputId: null,
          name: 'лампа 2',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
        'телевизор': DeviceEntity(
          id: 3,
          providerDeviceId: 'tv1',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.mediaDeviceTV,
          inputId: null,
          outputId: null,
          name: 'телевизор',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 1,
          floorId: 1,
          projectId: 1,
        ),
        'кондиционер': DeviceEntity(
          id: 4,
          providerDeviceId: 'ac1',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.thermostatAc,
          inputId: null,
          outputId: null,
          name: 'кондиционер',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
        'розетка 1': DeviceEntity(
          id: 5,
          providerDeviceId: 'socket1',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.socket,
          inputId: null,
          outputId: null,
          name: 'розетка 1',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 3,
          floorId: 1,
          projectId: 1,
        ),
        'свет на кухне': DeviceEntity(
          id: 6,
          providerDeviceId: 'light_kitchen',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.light,
          inputId: null,
          outputId: null,
          name: 'свет на кухне',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 3,
          floorId: 1,
          projectId: 1,
        ),
        'дверь с замком': DeviceEntity(
          id: 5,
          providerDeviceId: 'door_lock',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.doorWithLock,
          inputId: null,
          outputId: null,
          name: 'дверь с замком',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
        'правая штора': DeviceEntity(
          id: 6,
          providerDeviceId: 'right_curtain',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.openableCurtain,
          inputId: null,
          outputId: null,
          name: 'правая штора',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
        'левая штора': DeviceEntity(
          id: 6,
          providerDeviceId: 'left_curtain',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.openableCurtain,
          inputId: null,
          outputId: null,
          name: 'левая штора',
          capabilities: [],
          properties: [],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
        'Датчик климата': DeviceEntity(
          id: 6,
          providerDeviceId: 'climate_sensor',
          providerType: DeviceProviderType.hardware,
          type: DeviceType.sensorClimate,
          inputId: null,
          outputId: null,
          name: 'Датчик климата',
          capabilities: [],
          properties: [
            DevicePropertyEntity.float(
              state: DeviceCapabilityStateEntity.temperature(value: 22),
              parameters: null,
            ),
          ],
          createdAt: now,
          updatedAt: now,
          roomId: 2,
          floorId: 1,
          projectId: 1,
        ),
      };
      commandParser = CommandParser();
      commandParser.setDevices(testDevices.values.toList());
    });

    group('Тесты команд по прямому имени', () {
      test('Включи лампу 1 (точное имя)', () {
        final result = commandParser.parse('включи лампа 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Выключи лампу 2 (точное имя)', () {
        final result = commandParser.parse('выключи лампа 2');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 2']!,
            isOn: false,
          ),
        );
      });

      test('Включи телевизор (точное имя)', () {
        final result = commandParser.parse('включи телевизор');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['телевизор']!,
            isOn: true,
          ),
        );
      });

      test('Включи кондиционер (точное имя)', () {
        final result = commandParser.parse('включи кондиционер');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['кондиционер']!,
            isOn: true,
          ),
        );
      });

      test('Включи розетку 1 (точное имя)', () {
        final result = commandParser.parse('включи розетка 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['розетка 1']!,
            isOn: true,
          ),
        );
      });

      test('Включи свет на кухне (точное составное имя)', () {
        final result = commandParser.parse('включи свет на кухне');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['свет на кухне']!,
            isOn: true,
          ),
        );
      });

      test('Выключи все лампы (множественное число)', () {
        final result = commandParser.parse('выключи лампы');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(2));
        // Должны найтись обе лампы
        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 1']!,
              isOn: false,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 2']!,
              isOn: false,
            ),
          ]),
        );
      });

      test('Выключи весь свет', () {
        final result = commandParser.parse('выключи свет');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(3));

        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 1']!,
              isOn: false,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 2']!,
              isOn: false,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['свет на кухне']!,
              isOn: false,
            ),
          ]),
        );
      });

      test('Открой дверь с замком', () {
        final result = commandParser.parse('открой дверь');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.open(
            device: testDevices['дверь с замком']!,
            openValue: 100,
          ),
        );
      });

      test('Закрой дверь с замком', () {
        final result = commandParser.parse('закрой дверь');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.open(
            device: testDevices['дверь с замком']!,
            openValue: 0,
          ),
        );
      });

      test('Открой правую штору', () {
        final result = commandParser.parse('открой правую штору');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.open(
            device: testDevices['правая штора']!,
            openValue: 100,
          ),
        );
      });

      test('Закрой правую штору', () {
        final result = commandParser.parse('закрой правую штору');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.open(
            device: testDevices['правая штора']!,
            openValue: 0,
          ),
        );
      });

      test('Какая температура в комнате?', () {
        final result = commandParser.parse('какая температура в комнате?');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.sayTemperature(
            temperature: 22,
          ),
        );
      });
    });

    group('Тесты с числительными', () {
      // test('Конвертация числительных', () {
      //   final result = preprocessTextWithNumbers('включи лампу один');
      //   expect(result, equals('включи лампу 1'));
      // });
      test('Включи лампу 1', () {
        final result = commandParser.parse('включи лампу 1');
        expect(result, isNotNull);

        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Включи лампу один', () {
        final result = commandParser.parse('включи лампу один');
        expect(result, isNotNull);

        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Найти лампу 1 по слову "первую"', () {
        final result = commandParser.parse('включи лампу один');
        expect(result, isNotNull);

        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Выключи лампу 2 по цифре', () {
        final result = commandParser.parse('выключи лампу 2');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 2']!,
            isOn: false,
          ),
        );
      });

      test('Выключи лампу 2 по слову "два"', () {
        final result = commandParser.parse('выключи лампу два');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 2']!,
            isOn: false,
          ),
        );
      });

      test('Выключи лампу 2 по слову "вторую"', () {
        final result = commandParser.parse('выключи вторую лампу');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 2']!,
            isOn: false,
          ),
        );
      });

      test('Температуры в комнате?', () {
        final result = commandParser.parse('Температуры в комнате?');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.sayTemperature(
            temperature: 22,
          ),
        );
      });
    });

    group('Тесты с морфологией', () {
      test('Найти лампу в винительном падеже', () {
        final result = commandParser.parse('включи лампу 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Найти лампу в множественном числе', () {
        final result = commandParser.parse('включи лампы');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(2));
        // Проверяем что результат содержит устройство типа свет
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
        expect(
          result.last,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 2']!,
            isOn: true,
          ),
        );
      });

      test('Найти лампу в предложном падеже', () {
        final result = commandParser.parse('расскажи о лампе 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(result.first, isA<CommandParserResultEntity>());
      });
    });

    group('Тесты с синонимами', () {
      test('Найти телевизор как "тв"', () {
        final result = commandParser.parse('включи тв');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['телевизор']!,
            isOn: true,
          ),
        );
      });

      test('Найти телевизор как "телик"', () {
        final result = commandParser.parse('включи телик');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['телевизор']!,
            isOn: true,
          ),
        );
      });

      test('Найти кондиционер как "кондей"', () {
        final result = commandParser.parse('включи кондей');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['кондиционер']!,
            isOn: true,
          ),
        );
      });

      test('Найти свет как "освещение"', () {
        final result = commandParser.parse('включи освещение на кухне');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['свет на кухне']!,
            isOn: true,
          ),
        );
      });
    });

    group('Тесты составных названий', () {
      test('Найти "свет на кухне" полностью', () {
        final result = commandParser.parse('включи свет на кухне');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['свет на кухне']!,
            isOn: true,
          ),
        );
      });

      test('Найти "свет на кухне" в разном порядке', () {
        final result = commandParser.parse('включи на кухне свет');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['свет на кухне']!,
            isOn: true,
          ),
        );
      });

      test('Найти "свет на кухне" с дополнительными словами', () {
        final result =
            commandParser.parse('пожалуйста включи свет на кухне сейчас');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['свет на кухне']!,
            isOn: true,
          ),
        );
      });
    });

    group('Тесты приоритетов', () {
      test('Точное совпадение имеет приоритет', () {
        final now = DateTime.now();
        // Добавляем устройство с похожим названием
        final devicesWithSimilar = {
          ...testDevices,
          'лампа настольная 1': DeviceEntity(
            id: 99,
            providerDeviceId: 'lamp_similar',
            providerType: DeviceProviderType.hardware,
            type: DeviceType.light,
            inputId: null,
            outputId: null,
            name: 'лампа настольная 1',
            capabilities: [],
            properties: [],
            createdAt: now,
            updatedAt: now,
            roomId: 4,
            floorId: 1,
            projectId: 1,
          ),
        };

        final tempParser = CommandParser();
        tempParser.setDevices(devicesWithSimilar.values.toList());

        final result = tempParser.parse('включи лампу 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });
    });

    group('Граничные случаи', () {
      test('Пустая команда', () {
        final result = commandParser.parse('');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(0)); // Пустой результат для пустой команды
      });

      test('Команда без устройств', () {
        final result = commandParser.parse('привет как дела');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(0)); // Нет устройств - нет результата
      });

      test('Пустой список устройств', () {
        final emptyParser = CommandParser();
        emptyParser.setDevices([]);
        final result = emptyParser.parse('включи лампу 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(0));
      });

      test('Устройство с пустым названием', () {
        final now = DateTime.now();
        final devicesWithEmpty = [
          DeviceEntity(
            id: 999,
            providerDeviceId: 'empty',
            providerType: DeviceProviderType.hardware,
            type: DeviceType.light,
            inputId: null,
            outputId: null,
            name: '',
            capabilities: [],
            properties: [],
            createdAt: now,
            updatedAt: now,
            roomId: 1,
            floorId: 1,
            projectId: 1,
          ),
          ...testDevices.values,
        ];

        final tempParser = CommandParser();
        tempParser.setDevices(devicesWithEmpty);
        final result = tempParser.parse('включи лампу 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });
    });

    group('Тесты регистронезависимости', () {
      test('Поиск в верхнем регистре', () {
        final result = commandParser.parse('ВКЛЮЧИ ЛАМПУ 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });

      test('Поиск в смешанном регистре', () {
        final result = commandParser.parse('ВкЛюЧи лАмПу 1');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
      });
    });

    group('Тесты команд с несколькими действиями', () {
      test('Включи лампу 1 и выключи лампу 2', () {
        final result = commandParser.parse('включи лампу 1 и выключи лампу 2');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());

        // Ожидаем, что парсер найдет только первое действие
        // так как текущая реализация обрабатывает только одно действие за раз
        expect(result.length, equals(2));
        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 1']!,
              isOn: true,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 2']!,
              isOn: false,
            ),
          ]),
        );
      });

      test('Выключи лампу 1 и лампу 2', () {
        final result = commandParser.parse('выключи лампу 1 и лампу 2');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(2));

        // Проверяем, что обе лампы будут выключены
        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 1']!,
              isOn: false,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 2']!,
              isOn: false,
            ),
          ]),
        );
      });

      test('Включи лампу 1 и лампу 2', () {
        final result = commandParser.parse('включи лампу 1 и лампу 2');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(2));

        // Проверяем, что обе лампы будут включены
        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 1']!,
              isOn: true,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['лампа 2']!,
              isOn: true,
            ),
          ]),
        );
      });

      test('Выключи телевизор и кондиционер', () {
        final result = commandParser.parse('выключи телевизор и кондиционер');
        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(2));

        expect(
          result,
          containsAllInOrder([
            CommandParserResultEntity.onOff(
              device: testDevices['телевизор']!,
              isOn: false,
            ),
            CommandParserResultEntity.onOff(
              device: testDevices['кондиционер']!,
              isOn: false,
            ),
          ]),
        );
      });
    });

    group('Тесты производительности', () {
      test('Поиск в большом списке устройств', () {
        final now = DateTime.now();
        // Создаем большой список устройств
        final bigDeviceList = <DeviceEntity>[];
        for (int i = 1; i <= 1000; i++) {
          bigDeviceList.add(DeviceEntity(
            id: i + 10000,
            providerDeviceId: 'device_$i',
            providerType: DeviceProviderType.hardware,
            type: DeviceType.light,
            inputId: null,
            outputId: null,
            name: 'устройство $i',
            capabilities: [],
            properties: [],
            createdAt: now,
            updatedAt: now,
            roomId: 1,
            floorId: 1,
            projectId: 1,
          ));
        }
        bigDeviceList.addAll(testDevices.values);

        final bigParser = CommandParser();
        bigParser.setDevices(bigDeviceList);

        final stopwatch = Stopwatch()..start();
        final result = bigParser.parse('включи лампу 1');
        stopwatch.stop();

        expect(result, isNotNull);
        expect(result, isA<List<CommandParserResultEntity>>());
        expect(result.length, equals(1));
        expect(
          result.first,
          CommandParserResultEntity.onOff(
            device: testDevices['лампа 1']!,
            isOn: true,
          ),
        );
        // Проверяем, что поиск выполняется быстро (менее 100мс)
        expect(stopwatch.elapsedMilliseconds, lessThan(100));
      });
    });
  });
}
