// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_device_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDeviceResponseModel {
  String get id;
  String get name;
  DeviceStatusInfoModel get statusInfo;
  String? get description;
  String? get room;
  String get type;
  Map<String, dynamic>? get customData;
  List<Map<String, dynamic>>? get capabilities;
  List<Map<String, dynamic>>? get properties;
  Map<String, dynamic>? get deviceInfo;

  /// Serializes this YandexDeviceResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDeviceResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.statusInfo, statusInfo) ||
                other.statusInfo == statusInfo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.customData, customData) &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties) &&
            const DeepCollectionEquality()
                .equals(other.deviceInfo, deviceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      statusInfo,
      description,
      room,
      type,
      const DeepCollectionEquality().hash(customData),
      const DeepCollectionEquality().hash(capabilities),
      const DeepCollectionEquality().hash(properties),
      const DeepCollectionEquality().hash(deviceInfo));

  @override
  String toString() {
    return 'YandexDeviceResponseModel(id: $id, name: $name, statusInfo: $statusInfo, description: $description, room: $room, type: $type, customData: $customData, capabilities: $capabilities, properties: $properties, deviceInfo: $deviceInfo)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _YandexDeviceResponseModel extends YandexDeviceResponseModel {
  const _YandexDeviceResponseModel(
      {required this.id,
      required this.name,
      required this.statusInfo,
      required this.description,
      required this.room,
      required this.type,
      required final Map<String, dynamic>? customData,
      required final List<Map<String, dynamic>>? capabilities,
      required final List<Map<String, dynamic>>? properties,
      required final Map<String, dynamic>? deviceInfo})
      : _customData = customData,
        _capabilities = capabilities,
        _properties = properties,
        _deviceInfo = deviceInfo,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final DeviceStatusInfoModel statusInfo;
  @override
  final String? description;
  @override
  final String? room;
  @override
  final String type;
  final Map<String, dynamic>? _customData;
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Map<String, dynamic>>? _capabilities;
  @override
  List<Map<String, dynamic>>? get capabilities {
    final value = _capabilities;
    if (value == null) return null;
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _properties;
  @override
  List<Map<String, dynamic>>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _deviceInfo;
  @override
  Map<String, dynamic>? get deviceInfo {
    final value = _deviceInfo;
    if (value == null) return null;
    if (_deviceInfo is EqualUnmodifiableMapView) return _deviceInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$YandexDeviceResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDeviceResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.statusInfo, statusInfo) ||
                other.statusInfo == statusInfo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._deviceInfo, _deviceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      statusInfo,
      description,
      room,
      type,
      const DeepCollectionEquality().hash(_customData),
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_deviceInfo));

  @override
  String toString() {
    return 'YandexDeviceResponseModel(id: $id, name: $name, statusInfo: $statusInfo, description: $description, room: $room, type: $type, customData: $customData, capabilities: $capabilities, properties: $properties, deviceInfo: $deviceInfo)';
  }
}

// dart format on
