// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevicePositionModel _$DevicePositionModelFromJson(Map<String, dynamic> json) {
  return _DevicePositionModel.fromJson(json);
}

/// @nodoc
mixin _$DevicePositionModel {
  int get id => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get angle => throw _privateConstructorUsedError;
  String? get iconMediaPath => throw _privateConstructorUsedError;
  String? get disabledIconMediaPath => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DevicePositionModelImpl extends _DevicePositionModel {
  const _$DevicePositionModelImpl(
      {required this.id,
      required this.x,
      required this.y,
      required this.angle,
      required this.iconMediaPath,
      required this.disabledIconMediaPath,
      required this.deviceId})
      : super._();

  factory _$DevicePositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevicePositionModelImplFromJson(json);

  @override
  final int id;
  @override
  final double x;
  @override
  final double y;
  @override
  final double angle;
  @override
  final String? iconMediaPath;
  @override
  final String? disabledIconMediaPath;
  @override
  final int deviceId;

  @override
  String toString() {
    return 'DevicePositionModel(id: $id, x: $x, y: $y, angle: $angle, iconMediaPath: $iconMediaPath, disabledIconMediaPath: $disabledIconMediaPath, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePositionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.iconMediaPath, iconMediaPath) ||
                other.iconMediaPath == iconMediaPath) &&
            (identical(other.disabledIconMediaPath, disabledIconMediaPath) ||
                other.disabledIconMediaPath == disabledIconMediaPath) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, x, y, angle, iconMediaPath,
      disabledIconMediaPath, deviceId);
}

abstract class _DevicePositionModel extends DevicePositionModel {
  const factory _DevicePositionModel(
      {required final int id,
      required final double x,
      required final double y,
      required final double angle,
      required final String? iconMediaPath,
      required final String? disabledIconMediaPath,
      required final int deviceId}) = _$DevicePositionModelImpl;
  const _DevicePositionModel._() : super._();

  factory _DevicePositionModel.fromJson(Map<String, dynamic> json) =
      _$DevicePositionModelImpl.fromJson;

  @override
  int get id;
  @override
  double get x;
  @override
  double get y;
  @override
  double get angle;
  @override
  String? get iconMediaPath;
  @override
  String? get disabledIconMediaPath;
  @override
  int get deviceId;
}
