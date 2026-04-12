import 'package:command_parser/src/domain/domain.dart';
import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:snowball_stemmer/snowball_stemmer.dart';

import 'normalize_numbers.dart';

enum CommandAction {
  turnOn,
  turnOff,
  open,
  close,
  sayTemperature,
}

class CommandParser {
  final synonymMap = {
    'телевизор': ['тв', 'телик', 'телека', 'телек'],
    'свет': ['освещение'],
    'кондиционер': ['кондей'],
  };

  final actions = {
    CommandAction.turnOn: ["включи", "включить", "зажги"],
    CommandAction.turnOff: ["выключи", "выключить", "потуши"],
    CommandAction.open: ["открой", "открыть", "раскрой"],
    CommandAction.close: ["закрой", "закрыть", "прикрой"],
    CommandAction.sayTemperature: ["температура", "температуру", "температуры"],
  };

  List<DeviceEntity> _devices = [];
  Map<String, List<String>> _deviceNameWords = {};

  final _stemmer = SnowballStemmer(Algorithm.russian);

  // Словарь для преобразования множественного числа в единственное
  final _pluralToSingular = {
    'лампы': 'лампа',
    'светильники': 'светильник',
    'телевизоры': 'телевизор',
    'кондиционеры': 'кондиционер',
    'устройства': 'устройство',
  };

  bool _isPluralForm(String word) {
    return _pluralToSingular.containsKey(word);
  }

  String _getSingularForm(String word) {
    return _pluralToSingular[word] ?? word;
  }

  List<String> _normalizeSynonyms(List<String> words) {
    return words.map((word) {
      // Ищем, является ли слово синонимом
      for (final entry in synonymMap.entries) {
        final mainTerm = entry.key;
        final synonyms = entry.value;
        if (synonyms.contains(word)) {
          return mainTerm;
        }
      }
      return word;
    }).toList();
  }

  List<String> _extractDeviceNameWords(String deviceName) {
    final words = deviceName
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((word) => word.replaceAll(RegExp(r'[^\wа-яА-Я1-9]'), ''))
        .where((word) => word.isNotEmpty)
        .toList();

    final normalizedWords = normalizeNumbers(words);
    final synonymNormalizedWords = _normalizeSynonyms(normalizedWords);

    return [
      ...synonymNormalizedWords.map((word) => _stemmer.stem(word)),
    ];
  }

  void setDevices(List<DeviceEntity> devices) {
    _devices = devices;
    _deviceNameWords = {};
    for (var device in devices) {
      final words = _extractDeviceNameWords(device.name);
      _deviceNameWords[device.name] = words;
    }
  }

  List<({String word, CommandAction action})> _detectActions(String command) {
    final commandWords = command.toLowerCase().split(RegExp(r'\s+'));
    final detectedActions = <({String word, CommandAction action})>[];
    for (final word in commandWords) {
      for (final action in actions.entries) {
        if (action.value.contains(word)) {
          detectedActions.add((word: word, action: action.key));
        }
      }
    }
    return detectedActions;
  }

  bool isAllLight(String command) {
    final lightRegExp =
        RegExp(r'(?<=\s|^)' + RegExp.escape('свет') + r'(?=\s|$)');
    return lightRegExp.hasMatch(command.toLowerCase());
  }

  List<DeviceEntity> _detectDevices(String c) {
    if (isAllLight(c)) {
      return _devices
          .where((device) => [
                DeviceType.light,
                DeviceType.lightCeiling,
                DeviceType.lightLamp,
                DeviceType.lightStrip,
              ].contains(device.type))
          .toList();
    }
    final commandWords = c
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();

    final normalizedWords = normalizeNumbers(commandWords);
    final synonymNormalizedWords = _normalizeSynonyms(normalizedWords);

    // Проверяем, есть ли в команде множественное число
    bool hasPluralForm = false;
    final singularWords = synonymNormalizedWords.map((word) {
      if (_isPluralForm(word)) {
        hasPluralForm = true;
        return _getSingularForm(word);
      }
      return word;
    }).toList();

    final normalizedCommand = singularWords.join(" ");
    final devicesFoundBySimpleSearch = _devices.where((device) {
      final deviceNameWords = _deviceNameWords[device.name] ?? [];
      return deviceNameWords.any((word) => normalizedCommand.contains(word));
    }).toList();

    final matchedPriorities = <DeviceEntity, int>{};
    for (final device in devicesFoundBySimpleSearch) {
      final priority = _calculateMatchPriority(normalizedCommand, device.name);
      if (priority > 0) {
        matchedPriorities[device] = priority;
      }
    }

    if (matchedPriorities.isEmpty) return [];

    // Если обнаружено множественное число, возвращаем все подходящие устройства
    if (hasPluralForm) {
      // Сортируем по приоритету и возвращаем все устройства выше определенного порога
      final sortedMatches = matchedPriorities.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      // Возвращаем все устройства, которые имеют приемлемый приоритет
      // Можно настроить минимальный порог приоритета
      final minPriority =
          sortedMatches.first.value * 0.3; // 30% от максимального приоритета
      return sortedMatches
          .where((entry) => entry.value >= minPriority)
          .map((entry) => entry.key)
          .toList();
    }

    // Возвращаем устройство с наивысшим приоритетом (для единственного числа)
    final sortedMatches = matchedPriorities.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final maxPriority = sortedMatches.first.value;

    return sortedMatches
        .where((entry) => entry.value == maxPriority)
        .map((entry) => entry.key)
        .toList();
  }

  List<CommandParserResultEntity> parse(String command) {
    final detectedActions = _detectActions(command);
    if (detectedActions.isEmpty) {
      return [];
    }

    List<CommandParserResultEntity> results = [];
    String currentCommand = '';
    var currentActionIndex = 0;

    void actionCompleted() {
      final detectedAction = detectedActions[currentActionIndex];
      final commandWithoutAction = currentCommand
          .replaceAll(
              RegExp(r'(?<=\s|^)' +
                  RegExp.escape(detectedAction.word) +
                  r'(?=\s|$)'),
              '')
          .trim();

      final detectedDevices = detectedAction.action ==
              CommandAction.sayTemperature
          ? _devices.where((device) => device.type == DeviceType.sensorClimate)
          : _detectDevices(commandWithoutAction);

      results.addAll([
        for (final device in detectedDevices)
          switch (detectedAction.action) {
            CommandAction.turnOn => CommandParserResultEntity.onOff(
                device: device,
                isOn: true,
              ),
            CommandAction.turnOff => CommandParserResultEntity.onOff(
                device: device,
                isOn: false,
              ),
            CommandAction.open => CommandParserResultEntity.open(
                device: device,
                openValue: 100,
              ),
            CommandAction.close => CommandParserResultEntity.open(
                device: device,
                openValue: 0,
              ),
            CommandAction.sayTemperature =>
              CommandParserResultEntity.sayTemperature(
                temperature: (device.properties
                            .firstWhereOrNull((property) => ((property.state
                                is DeviceCapabilityStateTemperatureEntity)))
                            ?.state as DeviceCapabilityStateTemperatureEntity?)
                        ?.value
                        .toInt() ??
                    -999,
              ),
          }
      ]);
      currentCommand = '';
      currentActionIndex += 1;
    }

    for (final word in command.split(RegExp(r'\s+'))) {
      if (currentActionIndex + 1 < detectedActions.length &&
          word == detectedActions[currentActionIndex + 1].word) {
        actionCompleted();
      } else {
        currentCommand += word + ' ';
      }
    }
    if (currentCommand.trim().isNotEmpty) {
      actionCompleted();
    }

    return results;
  }

  int _calculateMatchPriority(String text, String deviceName) {
    int priority = 0;

    final deviceNameStem =
        _deviceNameWords[deviceName]!.join(' ').toLowerCase();
    final textStem = text
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((word) => _stemmer.stem(word))
        .join(' ');

    // 1. Точное совпадение = высший приоритет
    if (textStem.contains(deviceNameStem)) {
      priority += 10000;
    }

    // 2. Точное совпадение целых слов имеет очень высокий приоритет
    final textWords = textStem.split(' ');
    final nameWords = deviceNameStem.split(' ');
    int exactWordMatches = 0;
    for (final nameWord in nameWords) {
      if (textWords.contains(nameWord)) {
        exactWordMatches++;
        priority += 5000; // Очень высокий приоритет за точное совпадение слова
      }
    }

    // 3. Если все слова названия найдены в тексте - дополнительный бонус
    if (exactWordMatches == nameWords.length && nameWords.isNotEmpty) {
      priority += 15000;
    }

    // // 4. Длина совпадающей части
    // priority += _getLongestCommonSubstring(textLower, nameLower).length * 50;

    // 6. Количество совпавших слов
    final commonWords =
        textWords.where((word) => nameWords.contains(word)).length;
    priority += commonWords * 100;

    return priority;
  }

  /// Находит наидлинейшую общую подстроку
  String _getLongestCommonSubstring(String s1, String s2) {
    String longest = '';
    for (int i = 0; i < s1.length; i++) {
      for (int j = i + 1; j <= s1.length; j++) {
        final substring = s1.substring(i, j);
        if (s2.contains(substring) && substring.length > longest.length) {
          longest = substring;
        }
      }
    }
    return longest;
  }
}
