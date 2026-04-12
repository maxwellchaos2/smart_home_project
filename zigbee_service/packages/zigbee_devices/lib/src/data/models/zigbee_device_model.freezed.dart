// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceModel {
  /// IEEE адрес устройства
  String get ieeeAddress;

  /// Человеко-понятное имя устройства, обычно совпадает с ieeeAddress
  String get friendlyName;

  /// Флаг, указывающий, отключено ли устройство
  bool get disabled;

  /// Тип устройства (например, Coordinator, EndDevice и т.д.)
  String get type;

  /// Завершено ли интервью устройства
  /// (interview_completed = true означает, что устройство успешно опрошено и готово к использованию)
  /// interview_completed = false означает, что устройство еще не опрошено или опрос не удался
  bool get interviewCompleted;

  /// Состояние интервью устройства (например, SUCCESSFUL, FAILED и т.д.)
  String get interviewState;

  /// Флаг, указывающий, находится ли устройство в процессе интервью
  bool get interviewing;

  /// Сетевой адрес устройства
  int get networkAddress;

  /// Производитель устройства (если доступно)
  String? get manufacturer;

  /// Модель устройства (если доступно)
  String? get modelId;

  /// Источник питания устройства (например, Battery, Mains и т.д., если доступ
  String? get powerSource;

  /// Идентификатор сборки программного обеспечения устройства (если доступно)
  /// Например, "Aug 19 2024"
  String? get softwareBuildId;

  /// Код даты устройства (если доступно)
  /// Например, "202410180958"
  String? get dateCode;

  /// Список конечных точек устройства и их конфигураций
  Map<String, dynamic> get endpoints;

  /// Определение устройства, включая описание, возможности и другие метаданные
  ZigbeeDeviceDefinitionModel? get definition;

  /// Поддерживается ли устройство
  bool get supported;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceModel &&
            (identical(other.ieeeAddress, ieeeAddress) ||
                other.ieeeAddress == ieeeAddress) &&
            (identical(other.friendlyName, friendlyName) ||
                other.friendlyName == friendlyName) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interviewCompleted, interviewCompleted) ||
                other.interviewCompleted == interviewCompleted) &&
            (identical(other.interviewState, interviewState) ||
                other.interviewState == interviewState) &&
            (identical(other.interviewing, interviewing) ||
                other.interviewing == interviewing) &&
            (identical(other.networkAddress, networkAddress) ||
                other.networkAddress == networkAddress) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.powerSource, powerSource) ||
                other.powerSource == powerSource) &&
            (identical(other.softwareBuildId, softwareBuildId) ||
                other.softwareBuildId == softwareBuildId) &&
            (identical(other.dateCode, dateCode) ||
                other.dateCode == dateCode) &&
            const DeepCollectionEquality().equals(other.endpoints, endpoints) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.supported, supported) ||
                other.supported == supported));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ieeeAddress,
      friendlyName,
      disabled,
      type,
      interviewCompleted,
      interviewState,
      interviewing,
      networkAddress,
      manufacturer,
      modelId,
      powerSource,
      softwareBuildId,
      dateCode,
      const DeepCollectionEquality().hash(endpoints),
      definition,
      supported);

  @override
  String toString() {
    return 'ZigbeeDeviceModel(ieeeAddress: $ieeeAddress, friendlyName: $friendlyName, disabled: $disabled, type: $type, interviewCompleted: $interviewCompleted, interviewState: $interviewState, interviewing: $interviewing, networkAddress: $networkAddress, manufacturer: $manufacturer, modelId: $modelId, powerSource: $powerSource, softwareBuildId: $softwareBuildId, dateCode: $dateCode, endpoints: $endpoints, definition: $definition, supported: $supported)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ZigbeeDeviceModel extends ZigbeeDeviceModel {
  const _ZigbeeDeviceModel(
      {required this.ieeeAddress,
      required this.friendlyName,
      required this.disabled,
      required this.type,
      required this.interviewCompleted,
      required this.interviewState,
      required this.interviewing,
      required this.networkAddress,
      this.manufacturer,
      this.modelId,
      this.powerSource,
      this.softwareBuildId,
      this.dateCode,
      required final Map<String, dynamic> endpoints,
      this.definition,
      required this.supported})
      : _endpoints = endpoints,
        super._();
  factory _ZigbeeDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$ZigbeeDeviceModelFromJson(json);

  /// IEEE адрес устройства
  @override
  final String ieeeAddress;

  /// Человеко-понятное имя устройства, обычно совпадает с ieeeAddress
  @override
  final String friendlyName;

  /// Флаг, указывающий, отключено ли устройство
  @override
  final bool disabled;

  /// Тип устройства (например, Coordinator, EndDevice и т.д.)
  @override
  final String type;

  /// Завершено ли интервью устройства
  /// (interview_completed = true означает, что устройство успешно опрошено и готово к использованию)
  /// interview_completed = false означает, что устройство еще не опрошено или опрос не удался
  @override
  final bool interviewCompleted;

  /// Состояние интервью устройства (например, SUCCESSFUL, FAILED и т.д.)
  @override
  final String interviewState;

  /// Флаг, указывающий, находится ли устройство в процессе интервью
  @override
  final bool interviewing;

  /// Сетевой адрес устройства
  @override
  final int networkAddress;

  /// Производитель устройства (если доступно)
  @override
  final String? manufacturer;

  /// Модель устройства (если доступно)
  @override
  final String? modelId;

  /// Источник питания устройства (например, Battery, Mains и т.д., если доступ
  @override
  final String? powerSource;

  /// Идентификатор сборки программного обеспечения устройства (если доступно)
  /// Например, "Aug 19 2024"
  @override
  final String? softwareBuildId;

  /// Код даты устройства (если доступно)
  /// Например, "202410180958"
  @override
  final String? dateCode;

  /// Список конечных точек устройства и их конфигураций
  final Map<String, dynamic> _endpoints;

  /// Список конечных точек устройства и их конфигураций
  @override
  Map<String, dynamic> get endpoints {
    if (_endpoints is EqualUnmodifiableMapView) return _endpoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_endpoints);
  }

  /// Определение устройства, включая описание, возможности и другие метаданные
  @override
  final ZigbeeDeviceDefinitionModel? definition;

  /// Поддерживается ли устройство
  @override
  final bool supported;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceModel &&
            (identical(other.ieeeAddress, ieeeAddress) ||
                other.ieeeAddress == ieeeAddress) &&
            (identical(other.friendlyName, friendlyName) ||
                other.friendlyName == friendlyName) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interviewCompleted, interviewCompleted) ||
                other.interviewCompleted == interviewCompleted) &&
            (identical(other.interviewState, interviewState) ||
                other.interviewState == interviewState) &&
            (identical(other.interviewing, interviewing) ||
                other.interviewing == interviewing) &&
            (identical(other.networkAddress, networkAddress) ||
                other.networkAddress == networkAddress) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.powerSource, powerSource) ||
                other.powerSource == powerSource) &&
            (identical(other.softwareBuildId, softwareBuildId) ||
                other.softwareBuildId == softwareBuildId) &&
            (identical(other.dateCode, dateCode) ||
                other.dateCode == dateCode) &&
            const DeepCollectionEquality()
                .equals(other._endpoints, _endpoints) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.supported, supported) ||
                other.supported == supported));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ieeeAddress,
      friendlyName,
      disabled,
      type,
      interviewCompleted,
      interviewState,
      interviewing,
      networkAddress,
      manufacturer,
      modelId,
      powerSource,
      softwareBuildId,
      dateCode,
      const DeepCollectionEquality().hash(_endpoints),
      definition,
      supported);

  @override
  String toString() {
    return 'ZigbeeDeviceModel(ieeeAddress: $ieeeAddress, friendlyName: $friendlyName, disabled: $disabled, type: $type, interviewCompleted: $interviewCompleted, interviewState: $interviewState, interviewing: $interviewing, networkAddress: $networkAddress, manufacturer: $manufacturer, modelId: $modelId, powerSource: $powerSource, softwareBuildId: $softwareBuildId, dateCode: $dateCode, endpoints: $endpoints, definition: $definition, supported: $supported)';
  }
}

// dart format on
