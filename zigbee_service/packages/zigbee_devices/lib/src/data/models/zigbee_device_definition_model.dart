import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zigbee_devices/src/data/models/zigbee_device_expose_model.dart';

part 'zigbee_device_definition_model.freezed.dart';
part 'zigbee_device_definition_model.g.dart';

@Freezed(fromJson: true)
sealed class ZigbeeDeviceDefinitionModel with _$ZigbeeDeviceDefinitionModel {
  const ZigbeeDeviceDefinitionModel._();

  const factory ZigbeeDeviceDefinitionModel({
    /// Производитель устройства
    /// Например, "Yandex", "Tuya" и т.д.
    required String vendor,

    /// Модель устройства
    /// Например, "YNDX-00535", "TS0201" и т
    required String model,

    /// Поддерживает ли устройство обновление по воздуху (OTA)
    required bool supportsOta,

    /// Источник определения устройства
    /// Обычно "native" для встроенных определений
    /// или "z2m" для определений из Zigbee2MQTT
    required String source,

    /// Список возможностей устройства, включая свойства, действия и т.д.
    required List<ZigbeeDeviceExposeModel> exposes,

    /// Список опций устройства, если доступны
    /// Например, калибровка, точность и т.д.
    required List<Map<String, dynamic>> options,

    /// Описание устройства
    required String description,
  }) = _ZigbeeDeviceDefinitionModel;

  factory ZigbeeDeviceDefinitionModel.fromJson(Map<String, Object?> json) =>
      _$ZigbeeDeviceDefinitionModelFromJson(json);
}
