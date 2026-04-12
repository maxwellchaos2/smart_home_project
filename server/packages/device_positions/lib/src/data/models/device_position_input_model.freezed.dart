// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_position_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DevicePositionInputModel {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get angle => throw _privateConstructorUsedError;
  String? get iconMediaPath => throw _privateConstructorUsedError;
  String? get disabledIconMediaPath => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;

  /// Serializes this DevicePositionInputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DevicePositionInputModelImpl extends _DevicePositionInputModel {
  const _$DevicePositionInputModelImpl(
      {required this.x,
      required this.y,
      required this.angle,
      required this.iconMediaPath,
      required this.disabledIconMediaPath,
      required this.deviceId})
      : super._();

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
    return 'DevicePositionInputModel(x: $x, y: $y, angle: $angle, iconMediaPath: $iconMediaPath, disabledIconMediaPath: $disabledIconMediaPath, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePositionInputModelImpl &&
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
  int get hashCode => Object.hash(
      runtimeType, x, y, angle, iconMediaPath, disabledIconMediaPath, deviceId);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevicePositionInputModelImplToJson(
      this,
    );
  }
}

abstract class _DevicePositionInputModel extends DevicePositionInputModel {
  const factory _DevicePositionInputModel(
      {required final double x,
      required final double y,
      required final double angle,
      required final String? iconMediaPath,
      required final String? disabledIconMediaPath,
      required final int deviceId}) = _$DevicePositionInputModelImpl;
  const _DevicePositionInputModel._() : super._();

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
