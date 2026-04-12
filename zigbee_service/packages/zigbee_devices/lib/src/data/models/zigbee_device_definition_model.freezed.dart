// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_definition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceDefinitionModel {
  /// Производитель устройства
  /// Например, "Yandex", "Tuya" и т.д.
  String get vendor;

  /// Модель устройства
  /// Например, "YNDX-00535", "TS0201" и т
  String get model;

  /// Поддерживает ли устройство обновление по воздуху (OTA)
  bool get supportsOta;

  /// Источник определения устройства
  /// Обычно "native" для встроенных определений
  /// или "z2m" для определений из Zigbee2MQTT
  String get source;

  /// Список возможностей устройства, включая свойства, действия и т.д.
  List<ZigbeeDeviceExposeModel> get exposes;

  /// Список опций устройства, если доступны
  /// Например, калибровка, точность и т.д.
  List<Map<String, dynamic>> get options;

  /// Описание устройства
  String get description;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceDefinitionModel &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.supportsOta, supportsOta) ||
                other.supportsOta == supportsOta) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.exposes, exposes) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vendor,
      model,
      supportsOta,
      source,
      const DeepCollectionEquality().hash(exposes),
      const DeepCollectionEquality().hash(options),
      description);

  @override
  String toString() {
    return 'ZigbeeDeviceDefinitionModel(vendor: $vendor, model: $model, supportsOta: $supportsOta, source: $source, exposes: $exposes, options: $options, description: $description)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ZigbeeDeviceDefinitionModel extends ZigbeeDeviceDefinitionModel {
  const _ZigbeeDeviceDefinitionModel(
      {required this.vendor,
      required this.model,
      required this.supportsOta,
      required this.source,
      required final List<ZigbeeDeviceExposeModel> exposes,
      required final List<Map<String, dynamic>> options,
      required this.description})
      : _exposes = exposes,
        _options = options,
        super._();
  factory _ZigbeeDeviceDefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$ZigbeeDeviceDefinitionModelFromJson(json);

  /// Производитель устройства
  /// Например, "Yandex", "Tuya" и т.д.
  @override
  final String vendor;

  /// Модель устройства
  /// Например, "YNDX-00535", "TS0201" и т
  @override
  final String model;

  /// Поддерживает ли устройство обновление по воздуху (OTA)
  @override
  final bool supportsOta;

  /// Источник определения устройства
  /// Обычно "native" для встроенных определений
  /// или "z2m" для определений из Zigbee2MQTT
  @override
  final String source;

  /// Список возможностей устройства, включая свойства, действия и т.д.
  final List<ZigbeeDeviceExposeModel> _exposes;

  /// Список возможностей устройства, включая свойства, действия и т.д.
  @override
  List<ZigbeeDeviceExposeModel> get exposes {
    if (_exposes is EqualUnmodifiableListView) return _exposes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exposes);
  }

  /// Список опций устройства, если доступны
  /// Например, калибровка, точность и т.д.
  final List<Map<String, dynamic>> _options;

  /// Список опций устройства, если доступны
  /// Например, калибровка, точность и т.д.
  @override
  List<Map<String, dynamic>> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Описание устройства
  @override
  final String description;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceDefinitionModel &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.supportsOta, supportsOta) ||
                other.supportsOta == supportsOta) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._exposes, _exposes) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vendor,
      model,
      supportsOta,
      source,
      const DeepCollectionEquality().hash(_exposes),
      const DeepCollectionEquality().hash(_options),
      description);

  @override
  String toString() {
    return 'ZigbeeDeviceDefinitionModel(vendor: $vendor, model: $model, supportsOta: $supportsOta, source: $source, exposes: $exposes, options: $options, description: $description)';
  }
}

// dart format on
