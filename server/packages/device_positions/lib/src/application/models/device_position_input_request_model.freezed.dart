// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_position_input_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevicePositionInputRequestModel _$DevicePositionInputRequestModelFromJson(
    Map<String, dynamic> json) {
  return _DevicePositionInputRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DevicePositionInputRequestModel {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get angle => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$DevicePositionInputRequestModelImpl
    extends _DevicePositionInputRequestModel {
  const _$DevicePositionInputRequestModelImpl(
      {required this.x,
      required this.y,
      required this.angle,
      required this.deviceId})
      : super._();

  factory _$DevicePositionInputRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DevicePositionInputRequestModelImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double angle;
  @override
  final int deviceId;

  @override
  String toString() {
    return 'DevicePositionInputRequestModel(x: $x, y: $y, angle: $angle, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePositionInputRequestModelImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, angle, deviceId);
}

abstract class _DevicePositionInputRequestModel
    extends DevicePositionInputRequestModel {
  const factory _DevicePositionInputRequestModel(
      {required final double x,
      required final double y,
      required final double angle,
      required final int deviceId}) = _$DevicePositionInputRequestModelImpl;
  const _DevicePositionInputRequestModel._() : super._();

  factory _DevicePositionInputRequestModel.fromJson(Map<String, dynamic> json) =
      _$DevicePositionInputRequestModelImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get angle;
  @override
  int get deviceId;
}
