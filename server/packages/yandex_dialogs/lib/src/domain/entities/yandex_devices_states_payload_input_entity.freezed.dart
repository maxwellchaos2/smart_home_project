// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_devices_states_payload_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDevicesStatesPayloadInputEntity {
  String get userId;
  List<YandexDeviceStateInputEntity> get devices;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDevicesStatesPayloadInputEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.devices, devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(devices));

  @override
  String toString() {
    return 'YandexDevicesStatesPayloadInputEntity(userId: $userId, devices: $devices)';
  }
}

/// @nodoc

class _YandexDevicesStatesPayloadInputEntity
    implements YandexDevicesStatesPayloadInputEntity {
  const _YandexDevicesStatesPayloadInputEntity(
      {required this.userId,
      required final List<YandexDeviceStateInputEntity> devices})
      : _devices = devices;

  @override
  final String userId;
  final List<YandexDeviceStateInputEntity> _devices;
  @override
  List<YandexDeviceStateInputEntity> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDevicesStatesPayloadInputEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_devices));

  @override
  String toString() {
    return 'YandexDevicesStatesPayloadInputEntity(userId: $userId, devices: $devices)';
  }
}

// dart format on
