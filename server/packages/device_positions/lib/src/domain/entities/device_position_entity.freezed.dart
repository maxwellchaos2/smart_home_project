// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_position_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DevicePositionEntity {
  int get id => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get angle => throw _privateConstructorUsedError;
  String? get iconMediaPath => throw _privateConstructorUsedError;
  String? get disabledIconMediaPath => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;

  /// Create a copy of DevicePositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DevicePositionEntityCopyWith<DevicePositionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicePositionEntityCopyWith<$Res> {
  factory $DevicePositionEntityCopyWith(DevicePositionEntity value,
          $Res Function(DevicePositionEntity) then) =
      _$DevicePositionEntityCopyWithImpl<$Res, DevicePositionEntity>;
  @useResult
  $Res call(
      {int id,
      double x,
      double y,
      double angle,
      String? iconMediaPath,
      String? disabledIconMediaPath,
      int deviceId});
}

/// @nodoc
class _$DevicePositionEntityCopyWithImpl<$Res,
        $Val extends DevicePositionEntity>
    implements $DevicePositionEntityCopyWith<$Res> {
  _$DevicePositionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DevicePositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? x = null,
    Object? y = null,
    Object? angle = null,
    Object? iconMediaPath = freezed,
    Object? disabledIconMediaPath = freezed,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      iconMediaPath: freezed == iconMediaPath
          ? _value.iconMediaPath
          : iconMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      disabledIconMediaPath: freezed == disabledIconMediaPath
          ? _value.disabledIconMediaPath
          : disabledIconMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevicePositionEntityImplCopyWith<$Res>
    implements $DevicePositionEntityCopyWith<$Res> {
  factory _$$DevicePositionEntityImplCopyWith(_$DevicePositionEntityImpl value,
          $Res Function(_$DevicePositionEntityImpl) then) =
      __$$DevicePositionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double x,
      double y,
      double angle,
      String? iconMediaPath,
      String? disabledIconMediaPath,
      int deviceId});
}

/// @nodoc
class __$$DevicePositionEntityImplCopyWithImpl<$Res>
    extends _$DevicePositionEntityCopyWithImpl<$Res, _$DevicePositionEntityImpl>
    implements _$$DevicePositionEntityImplCopyWith<$Res> {
  __$$DevicePositionEntityImplCopyWithImpl(_$DevicePositionEntityImpl _value,
      $Res Function(_$DevicePositionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DevicePositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? x = null,
    Object? y = null,
    Object? angle = null,
    Object? iconMediaPath = freezed,
    Object? disabledIconMediaPath = freezed,
    Object? deviceId = null,
  }) {
    return _then(_$DevicePositionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      iconMediaPath: freezed == iconMediaPath
          ? _value.iconMediaPath
          : iconMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      disabledIconMediaPath: freezed == disabledIconMediaPath
          ? _value.disabledIconMediaPath
          : disabledIconMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DevicePositionEntityImpl extends _DevicePositionEntity {
  const _$DevicePositionEntityImpl(
      {required this.id,
      required this.x,
      required this.y,
      required this.angle,
      required this.iconMediaPath,
      required this.disabledIconMediaPath,
      required this.deviceId})
      : super._();

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
    return 'DevicePositionEntity(id: $id, x: $x, y: $y, angle: $angle, iconMediaPath: $iconMediaPath, disabledIconMediaPath: $disabledIconMediaPath, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePositionEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, x, y, angle, iconMediaPath,
      disabledIconMediaPath, deviceId);

  /// Create a copy of DevicePositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicePositionEntityImplCopyWith<_$DevicePositionEntityImpl>
      get copyWith =>
          __$$DevicePositionEntityImplCopyWithImpl<_$DevicePositionEntityImpl>(
              this, _$identity);
}

abstract class _DevicePositionEntity extends DevicePositionEntity {
  const factory _DevicePositionEntity(
      {required final int id,
      required final double x,
      required final double y,
      required final double angle,
      required final String? iconMediaPath,
      required final String? disabledIconMediaPath,
      required final int deviceId}) = _$DevicePositionEntityImpl;
  const _DevicePositionEntity._() : super._();

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

  /// Create a copy of DevicePositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevicePositionEntityImplCopyWith<_$DevicePositionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
