// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_device_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInDeviceInputModel {
  int get deviceId => throw _privateConstructorUsedError;

  /// Serializes this SignInDeviceInputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$SignInDeviceInputModelImpl extends _SignInDeviceInputModel {
  const _$SignInDeviceInputModelImpl({required this.deviceId}) : super._();

  @override
  final int deviceId;

  @override
  String toString() {
    return 'SignInDeviceInputModel(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInDeviceInputModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInDeviceInputModelImplToJson(
      this,
    );
  }
}

abstract class _SignInDeviceInputModel extends SignInDeviceInputModel {
  const factory _SignInDeviceInputModel({required final int deviceId}) =
      _$SignInDeviceInputModelImpl;
  const _SignInDeviceInputModel._() : super._();

  @override
  int get deviceId;
}
