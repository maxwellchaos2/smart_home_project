// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_devices_states_payload_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDevicesStatesPayloadInputModel {
  String get userId;
  List<YandexDeviceStateInputModel> get devices;

  /// Serializes this YandexDevicesStatesPayloadInputModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDevicesStatesPayloadInputModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.devices, devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(devices));

  @override
  String toString() {
    return 'YandexDevicesStatesPayloadInputModel(userId: $userId, devices: $devices)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _YandexDevicesStatesPayloadInputModel
    extends YandexDevicesStatesPayloadInputModel {
  const _YandexDevicesStatesPayloadInputModel(
      {required this.userId,
      required final List<YandexDeviceStateInputModel> devices})
      : _devices = devices,
        super._();

  @override
  final String userId;
  final List<YandexDeviceStateInputModel> _devices;
  @override
  List<YandexDeviceStateInputModel> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$YandexDevicesStatesPayloadInputModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDevicesStatesPayloadInputModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_devices));

  @override
  String toString() {
    return 'YandexDevicesStatesPayloadInputModel(userId: $userId, devices: $devices)';
  }
}

// dart format on
