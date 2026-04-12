// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_device_state_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDeviceStateInputEntity {
  String get id;
  YandexDeviceStateStatus get status;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDeviceStateInputEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @override
  String toString() {
    return 'YandexDeviceStateInputEntity(id: $id, status: $status)';
  }
}

/// @nodoc

class _YandexDeviceStateInputEntity implements YandexDeviceStateInputEntity {
  const _YandexDeviceStateInputEntity({required this.id, required this.status});

  @override
  final String id;
  @override
  final YandexDeviceStateStatus status;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDeviceStateInputEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @override
  String toString() {
    return 'YandexDeviceStateInputEntity(id: $id, status: $status)';
  }
}

// dart format on
