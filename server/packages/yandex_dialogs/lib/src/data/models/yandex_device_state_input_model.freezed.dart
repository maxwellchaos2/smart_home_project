// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_device_state_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDeviceStateInputModel {
  String get id;
  String get status;

  /// Serializes this YandexDeviceStateInputModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDeviceStateInputModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @override
  String toString() {
    return 'YandexDeviceStateInputModel(id: $id, status: $status)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _YandexDeviceStateInputModel extends YandexDeviceStateInputModel {
  const _YandexDeviceStateInputModel({required this.id, required this.status})
      : super._();

  @override
  final String id;
  @override
  final String status;

  @override
  Map<String, dynamic> toJson() {
    return _$YandexDeviceStateInputModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDeviceStateInputModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @override
  String toString() {
    return 'YandexDeviceStateInputModel(id: $id, status: $status)';
  }
}

// dart format on
