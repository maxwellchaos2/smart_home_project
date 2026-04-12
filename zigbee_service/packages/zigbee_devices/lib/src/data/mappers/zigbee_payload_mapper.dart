import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:zigbee_devices/src/data/data.dart';

abstract final class ZigbeePayloadMapper {
  static Map<String, dynamic> fromCapabilities({
    required List<DeviceCapabilityEntity> capabilities,
    required ZigbeeDeviceModel device,
  }) {
    final Map<String, dynamic> result = {};
    for (final capability in capabilities) {
      capability.mapOrNull(
        onOff: (cap) => cap.state?.mapOrNull(
          on: (state) {
            result['state'] = (state.value ?? true) ? 'OPEN' : 'CLOSE';
          },
        ),
        range: (cap) => cap.state?.mapOrNull(
          open: (state) {
            result['position'] = state.value.toInt();
          },
        ),
      );
    }
    return result;
  }

  static List<DeviceCapabilityEntity> toCapabilities({
    required Map<String, dynamic>? changedState,
    required ZigbeeDeviceModel device,
    bool isNew = false,
  }) {
    //  {"action":"toggle_b1_down","battery":100,"linkquality":192}

    final capabilities = <DeviceCapabilityEntity>[];

    bool isCover = changedState?.containsKey('state') == true &&
        changedState?.containsKey('opening_mode') == true;
    bool isCoverWithoutPosition =
        isCover && !(changedState?.containsKey('position') == true);

    if (isNew) {
      for (final expose
          in device.definition?.exposes ?? <ZigbeeDeviceExposeModel>[]) {
        if (expose.name == 'position' &&
            !(changedState?.containsKey('position') == true)) {
          isCoverWithoutPosition = false;
          capabilities.add(
            DeviceCapabilityEntity.range(
              reportable: true,
              state: DeviceCapabilityStateEntity.open(
                value: 0,
              ),
              parameters: DeviceCapabilityParametersEntity.open(
                unit: _unitFromExpose(expose),
                // range: _exposeToRange(expose),
                range: (
                  min: 0,
                  max: 100,
                  precision: 1,
                ),
              ),
            ),
          );
          // For yandex
          capabilities.add(
            DeviceCapabilityEntity.onOff(
              reportable: true,
              state: DeviceCapabilityStateEntity.on(
                value: false,
              ),
              parameters: null,
            ),
          );
        }
      }
    }
    for (final state
        in changedState?.entries ?? <MapEntry<String, dynamic>>[]) {
      final stateName = state.key;
      final stateValue = state.value;
      final expose = device.definition?.exposes
          .firstWhereOrNull((e) => e.name == stateName);
      if (stateName == 'position' && stateValue != null) {
        final position = stateValue as num;
        capabilities.add(
          DeviceCapabilityEntity.range(
            reportable: true,
            state: DeviceCapabilityStateEntity.open(
              value: position.toDouble(),
            ),
            parameters: DeviceCapabilityParametersEntity.open(
              unit: _unitFromExpose(expose),
              // range: _exposeToRange(expose),
              range: (
                min: 0,
                max: 100,
                precision: 1,
              ),
            ),
          ),
        );
        // For yandex
        capabilities.add(
          DeviceCapabilityEntity.onOff(
            reportable: true,
            state: DeviceCapabilityStateEntity.on(
              value: position < 100,
            ),
            parameters: null,
          ),
        );
      }
    }

    if (isCoverWithoutPosition) {
      capabilities.add(
        DeviceCapabilityEntity.range(
          reportable: true,
          state: DeviceCapabilityStateEntity.open(
            value: 0,
          ),
          parameters: DeviceCapabilityParametersEntity.open(
            unit: DeviceUnit.percent,
            range: (
              min: 0,
              max: 100,
              precision: 1,
            ),
          ),
        ),
      );
      // For yandex
      capabilities.add(
        DeviceCapabilityEntity.onOff(
          reportable: true,
          state: DeviceCapabilityStateEntity.on(
            value: false,
          ),
          parameters: null,
        ),
      );
    }

    return capabilities;
  }

  static DeviceUnit? unitFromString(String? unit) {
    return switch (unit) {
      '%' => DeviceUnit.percent,
      '°C' => DeviceUnit.celsius,
      '°F' => DeviceUnit.fahrenheit,
      _ => null,
    };
  }

  static List<DevicePropertyEntity> toProperties({
    required Map<String, dynamic>? changedState,
    required ZigbeeDeviceModel device,
    bool isNew = false,
  }) {
    //  {"action":"toggle_b1_down","battery":100,"linkquality":192}
    final properties = <DevicePropertyEntity>[];

    if (isNew) {
      for (final expose
          in device.definition?.exposes ?? <ZigbeeDeviceExposeModel>[]) {
        /// Если свойство уже изменилось, то пропускаем его
        if (changedState?.containsKey(expose.name) ?? false) {
          continue;
        }
        if (expose.name == 'battery' &&
            !(changedState?.containsKey(expose.name) ?? false)) {
          properties.add(
            DevicePropertyEntity.float(
              state: DeviceCapabilityStateEntity.batteryLevel(
                value: 0,
              ),
              parameters: DeviceCapabilityParametersEntity.batteryLevel(
                unit: _unitFromExpose(expose),
                range: _exposeToRange(expose),
              ),
            ),
          );
        } else if (expose.name == 'temperature' &&
            !(changedState?.containsKey('temperature') ?? false)) {
          properties.add(
            DevicePropertyEntity.float(
              state: DeviceCapabilityStateEntity.temperature(
                value: 0,
              ),
              parameters: DeviceCapabilityParametersEntity.temperature(
                unit: _unitFromExpose(expose),
                randomAccess: null,
                range: _exposeToRange(expose),
              ),
            ),
          );
        } else if (expose.name == 'humidity' &&
            !(changedState?.containsKey('humidity') ?? false)) {
          properties.add(
            DevicePropertyEntity.float(
              state: DeviceCapabilityStateEntity.humidity(
                value: 0,
              ),
              parameters: DeviceCapabilityParametersEntity.humidity(
                unit: _unitFromExpose(expose),
              ),
            ),
          );
        } else if (expose.name == 'action' &&
            !(changedState?.containsKey('action') ?? false)) {
          properties.add(
            DevicePropertyEntity.event(
              state: {
                'instance': 'button',
                'value': null,
              },
              parameters: _actionExposeTeToParameters(expose),
            ),
          );
        } else if (expose.name == 'water_leak' &&
            !(changedState?.containsKey('water_leak') ?? false)) {
          properties.add(
            _buildWaterLeakProperty(false, expose),
          );
        } else if (expose.name == 'smoke' &&
            !(changedState?.containsKey('smoke') ?? false)) {
          properties.add(
            _buildSmokeProperty(false, expose),
          );
        } else if (expose.name == 'contact' &&
            !(changedState?.containsKey('contact') ?? false)) {
          properties.add(
            _buildContactProperty(false, expose),
          );
        } else if (expose.name == 'vibration' &&
            !(changedState?.containsKey('vibration') ?? false)) {
          properties.add(
            _buildVibrationProperty(false, expose),
          );
        } else if (expose.name == 'occupancy' &&
            !(changedState?.containsKey('occupancy') ?? false)) {
          properties.add(
            _buildOccupancyProperty(false, expose),
          );
        }
      }
    }

    for (final state
        in changedState?.entries ?? <MapEntry<String, dynamic>>[]) {
      final stateName = state.key;
      final stateValue = state.value;
      final expose = device.definition?.exposes
          .firstWhereOrNull((e) => e.name == stateName);
      if (expose == null) {
        continue;
      }

      if (stateName == 'action' &&
          (device.definition!.description.toLowerCase().contains('button') ||
              device.definition!.description
                  .toLowerCase()
                  .contains('switch'))) {
        final parameters = _actionExposeTeToParameters(expose);
        final value = (parameters['events'] as List)
                .firstWhereOrNull((e) => e['original'] == stateValue)?['value']
            as String?;

        properties.add(
          DevicePropertyEntity.event(
            state: {
              'instance': 'button',
              'value': value,
            },
            parameters: parameters,
          ),
        );
      } else if (stateName == 'battery' && stateValue != null) {
        final battery = stateValue as num;
        properties.add(
          DevicePropertyEntity.float(
            state: DeviceCapabilityStateEntity.batteryLevel(
              value: battery.toDouble(),
            ),
            parameters: DeviceCapabilityParametersEntity.batteryLevel(
              unit: _unitFromExpose(expose),
              range: _exposeToRange(expose),
            ),
          ),
        );
      } else if (stateName == 'humidity' && stateValue != null) {
        final humidity = stateValue as num;
        properties.add(
          DevicePropertyEntity.float(
            state: DeviceCapabilityStateEntity.humidity(
              value: humidity.toDouble(),
            ),
            parameters: DeviceCapabilityParametersEntity.humidity(
              unit: _unitFromExpose(expose),
            ),
          ),
        );
      } else if (stateName == 'temperature' && stateValue != null) {
        final temperature = stateValue as num;
        properties.add(
          DevicePropertyEntity.float(
            state: DeviceCapabilityStateEntity.temperature(
              value: temperature.toDouble(),
            ),
            parameters: DeviceCapabilityParametersEntity.temperature(
              unit: _unitFromExpose(expose),
              randomAccess: null,
              range: _exposeToRange(expose),
            ),
          ),
        );
      } else if (stateName == 'water_leak' && stateValue != null) {
        final waterLeak = stateValue as bool;
        properties.add(
          _buildWaterLeakProperty(waterLeak, expose),
        );
      } else if (stateName == 'smoke' && stateValue != null) {
        final smoke = stateValue as bool;
        properties.add(
          _buildSmokeProperty(smoke, expose),
        );
      } else if (stateName == 'contact' && stateValue != null) {
        final contact = stateValue as bool;
        properties.add(
          _buildContactProperty(contact, expose),
        );
      } else if (stateName == 'vibration' && stateValue != null) {
        final vibration = stateValue as bool;
        properties.add(
          _buildVibrationProperty(vibration, expose),
        );
      } else if (stateName == 'occupancy' && stateValue != null) {
        final occupancy = stateValue as bool;
        properties.add(
          _buildOccupancyProperty(occupancy, expose),
        );
      }
    }
    return properties;
  }

  static DevicePropertyEntity _buildWaterLeakProperty(
      bool leak, ZigbeeDeviceExposeModel? expose) {
    return DevicePropertyEntity.event(
      state: {
        'instance': 'water_leak',
        'value': leak ? 'leak' : 'dry',
      },
      parameters: {
        "instance": "water_leak",
        "events": [
          {"value": "leak", "name": "протечка", "original": true},
          {"value": "dry", "name": "нет протечки", "original": false}
        ],
      },
    );
  }

  static DevicePropertyEntity _buildSmokeProperty(
      bool smoke, ZigbeeDeviceExposeModel? expose) {
    return DevicePropertyEntity.event(
      state: {
        'instance': 'smoke',
        'value': smoke ? 'detected' : 'not_detected',
      },
      parameters: {
        "instance": "smoke",
        "events": [
          {"value": "detected", "name": "дым", "original": true},
          {"value": "not_detected", "name": "нет дыма", "original": false}
        ],
      },
    );
  }
}

DevicePropertyEntity _buildContactProperty(
    bool contact, ZigbeeDeviceExposeModel? expose) {
  return DevicePropertyEntity.event(
    state: {
      'instance': 'open',
      'value': contact ? 'closed' : 'opened',
    },
    parameters: {
      "instance": "open",
      "events": [
        {"value": "opened", "name": "открыто", "original": false},
        {"value": "closed", "name": "закрыто", "original": true}
      ],
    },
  );
}

DevicePropertyEntity _buildVibrationProperty(
    bool vibration, ZigbeeDeviceExposeModel? expose) {
  return DevicePropertyEntity.event(
    state: {
      'instance': 'vibration',
      'value': vibration ? 'vibration' : 'tilt',
    },
    parameters: {
      "instance": "vibration",
      "events": [
        {"value": "vibration", "name": "вибрация", "original": true},
        {"value": "tilt", "name": "нет вибрации", "original": false}
      ],
    },
  );
}

DevicePropertyEntity _buildOccupancyProperty(
    bool occupancy, ZigbeeDeviceExposeModel? expose) {
  return DevicePropertyEntity.event(
    state: {
      'instance': 'motion',
      'value': occupancy ? 'detected' : 'not_detected',
    },
    parameters: {
      "instance": "motion",
      "events": [
        {"value": "detected", "name": "движение", "original": true},
        {"value": "not_detected", "name": "нет движения", "original": false}
      ],
    },
  );
}

bool _is2Button(ZigbeeDeviceExposeModel? expose) {
  final has1Button = expose?.values?.any((e) => e.contains('1')) ?? false;
  final has2Button = expose?.values?.any((e) => e.contains('2')) ?? false;
  return has1Button && has2Button;
}

Map<String, dynamic> _actionExposeTeToParameters(
    ZigbeeDeviceExposeModel? expose) {
  final events = <Map<String, dynamic>>[];
  final is2Button = _is2Button(expose);
  final click1 = expose?.values?.firstWhereOrNull((e) =>
      (is2Button ? e.contains('1') == true : true) &&
      (e.contains('toggle') || e.contains('single') || e.contains('click')));
  final click2 = is2Button
      ? expose?.values?.firstWhereOrNull((e) =>
          e.contains('2') &&
          (e.contains('toggle') || e.contains('single') || e.contains('click')))
      : null;
  if (click1 != null) {
    events.add({"value": "click", "original": click1});
  }
  if (click2 != null) {
    events.add({"value": "click_2", "original": click2});
  }

  final doubleClick1 = expose?.values?.firstWhereOrNull((e) =>
      (is2Button ? e.contains('1') == true : true) && (e.contains('double')));
  if (doubleClick1 != null) {
    events.add({"value": "double_click", "original": doubleClick1});
  }

  final doubleClick2 = is2Button
      ? expose?.values
          ?.firstWhereOrNull((e) => e.contains('2') && (e.contains('double')))
      : null;
  if (doubleClick2 != null) {
    events.add({"value": "double_click_2", "original": doubleClick2});
  }

  final longPress1 = expose?.values?.firstWhereOrNull((e) =>
      (is2Button ? e.contains('1') == true : true) &&
      (e.contains('long') || e.contains('hold')));
  if (longPress1 != null) {
    events.add({"value": "long_press", "original": longPress1});
  }

  final longPress2 = is2Button
      ? expose?.values?.firstWhereOrNull(
          (e) => e.contains('2') && (e.contains('long') || e.contains('hold')))
      : null;
  if (longPress2 != null) {
    events.add({"value": "long_press_2", "original": longPress2});
  }
  return {
    "instance": "button",
    "events": events,
  };
}

DeviceRangeEntity? _exposeToRange(ZigbeeDeviceExposeModel? expose) {
  return expose != null && expose.valueMin != null && expose.valueMax != null
      ? (
          min: expose.valueMin!.toDouble(),
          max: expose.valueMax!.toDouble(),
          precision: 1,
        )
      : null;
}

DeviceUnit? _unitFromExpose(ZigbeeDeviceExposeModel? expose) {
  return switch (expose?.unit) {
    '%' => DeviceUnit.percent,
    '°C' => DeviceUnit.celsius,
    '°F' => DeviceUnit.fahrenheit,
    _ => null,
  };
}
