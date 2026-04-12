// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_device_fields_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateDeviceFieldsInputModel {
  bool? get isOn => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$UpdateDeviceFieldsInputModelImpl extends _UpdateDeviceFieldsInputModel {
  const _$UpdateDeviceFieldsInputModelImpl(
      {required this.isOn, required this.isOpen, required this.value})
      : super._();

  @override
  final bool? isOn;
  @override
  final bool? isOpen;
  @override
  final double? value;

  @override
  String toString() {
    return 'UpdateDeviceFieldsInputModel(isOn: $isOn, isOpen: $isOpen, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceFieldsInputModelImpl &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isOn, isOpen, value);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDeviceFieldsInputModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateDeviceFieldsInputModel
    extends UpdateDeviceFieldsInputModel {
  const factory _UpdateDeviceFieldsInputModel(
      {required final bool? isOn,
      required final bool? isOpen,
      required final double? value}) = _$UpdateDeviceFieldsInputModelImpl;
  const _UpdateDeviceFieldsInputModel._() : super._();

  @override
  bool? get isOn;
  @override
  bool? get isOpen;
  @override
  double? get value;
}
