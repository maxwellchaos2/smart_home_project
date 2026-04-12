// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices_state_input_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DevicesStateInputRequestModel {
  List<DeviceStateInputRequestModel> get devices;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DevicesStateInputRequestModel &&
            const DeepCollectionEquality().equals(other.devices, devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(devices));

  @override
  String toString() {
    return 'DevicesStateInputRequestModel(devices: $devices)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _DevicesStateInputRequestModel extends DevicesStateInputRequestModel {
  const _DevicesStateInputRequestModel(
      {required final List<DeviceStateInputRequestModel> devices})
      : _devices = devices,
        super._();
  factory _DevicesStateInputRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DevicesStateInputRequestModelFromJson(json);

  final List<DeviceStateInputRequestModel> _devices;
  @override
  List<DeviceStateInputRequestModel> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DevicesStateInputRequestModel &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @override
  String toString() {
    return 'DevicesStateInputRequestModel(devices: $devices)';
  }
}

/// @nodoc
mixin _$DeviceStateInputRequestModel {
  String get id;
  Map<String, dynamic>? get customData;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceStateInputRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.customData, customData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(customData));

  @override
  String toString() {
    return 'DeviceStateInputRequestModel(id: $id, customData: $customData)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _DeviceStateInputRequestModel extends DeviceStateInputRequestModel {
  const _DeviceStateInputRequestModel(
      {required this.id, required final Map<String, dynamic>? customData})
      : _customData = customData,
        super._();
  factory _DeviceStateInputRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateInputRequestModelFromJson(json);

  @override
  final String id;
  final Map<String, dynamic>? _customData;
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceStateInputRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_customData));

  @override
  String toString() {
    return 'DeviceStateInputRequestModel(id: $id, customData: $customData)';
  }
}

// dart format on
