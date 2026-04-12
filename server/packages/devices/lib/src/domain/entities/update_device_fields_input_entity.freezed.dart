// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_device_fields_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateDeviceFieldsInputEntity {
  bool? get isOn => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateDeviceFieldsInputEntityImpl
    implements _UpdateDeviceFieldsInputEntity {
  const _$UpdateDeviceFieldsInputEntityImpl(
      {required this.isOn, required this.isOpen, required this.value});

  @override
  final bool? isOn;
  @override
  final bool? isOpen;
  @override
  final double? value;

  @override
  String toString() {
    return 'UpdateDeviceFieldsInputEntity(isOn: $isOn, isOpen: $isOpen, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceFieldsInputEntityImpl &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn, isOpen, value);
}

abstract class _UpdateDeviceFieldsInputEntity
    implements UpdateDeviceFieldsInputEntity {
  const factory _UpdateDeviceFieldsInputEntity(
      {required final bool? isOn,
      required final bool? isOpen,
      required final double? value}) = _$UpdateDeviceFieldsInputEntityImpl;

  @override
  bool? get isOn;
  @override
  bool? get isOpen;
  @override
  double? get value;
}
