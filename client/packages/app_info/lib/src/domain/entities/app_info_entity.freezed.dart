// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppInfoEntity {
  String get deviceId => throw _privateConstructorUsedError;
  DeviceInfoEntity get device => throw _privateConstructorUsedError;
  PackageInfoEntity get package => throw _privateConstructorUsedError;

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppInfoEntityCopyWith<AppInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoEntityCopyWith<$Res> {
  factory $AppInfoEntityCopyWith(
          AppInfoEntity value, $Res Function(AppInfoEntity) then) =
      _$AppInfoEntityCopyWithImpl<$Res, AppInfoEntity>;
  @useResult
  $Res call(
      {String deviceId, DeviceInfoEntity device, PackageInfoEntity package});

  $DeviceInfoEntityCopyWith<$Res> get device;
  $PackageInfoEntityCopyWith<$Res> get package;
}

/// @nodoc
class _$AppInfoEntityCopyWithImpl<$Res, $Val extends AppInfoEntity>
    implements $AppInfoEntityCopyWith<$Res> {
  _$AppInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? device = null,
    Object? package = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceInfoEntity,
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as PackageInfoEntity,
    ) as $Val);
  }

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoEntityCopyWith<$Res> get device {
    return $DeviceInfoEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PackageInfoEntityCopyWith<$Res> get package {
    return $PackageInfoEntityCopyWith<$Res>(_value.package, (value) {
      return _then(_value.copyWith(package: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppInfoEntityImplCopyWith<$Res>
    implements $AppInfoEntityCopyWith<$Res> {
  factory _$$AppInfoEntityImplCopyWith(
          _$AppInfoEntityImpl value, $Res Function(_$AppInfoEntityImpl) then) =
      __$$AppInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId, DeviceInfoEntity device, PackageInfoEntity package});

  @override
  $DeviceInfoEntityCopyWith<$Res> get device;
  @override
  $PackageInfoEntityCopyWith<$Res> get package;
}

/// @nodoc
class __$$AppInfoEntityImplCopyWithImpl<$Res>
    extends _$AppInfoEntityCopyWithImpl<$Res, _$AppInfoEntityImpl>
    implements _$$AppInfoEntityImplCopyWith<$Res> {
  __$$AppInfoEntityImplCopyWithImpl(
      _$AppInfoEntityImpl _value, $Res Function(_$AppInfoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? device = null,
    Object? package = null,
  }) {
    return _then(_$AppInfoEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceInfoEntity,
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as PackageInfoEntity,
    ));
  }
}

/// @nodoc

class _$AppInfoEntityImpl extends _AppInfoEntity {
  const _$AppInfoEntityImpl(
      {required this.deviceId, required this.device, required this.package})
      : super._();

  @override
  final String deviceId;
  @override
  final DeviceInfoEntity device;
  @override
  final PackageInfoEntity package;

  @override
  String toString() {
    return 'AppInfoEntity(deviceId: $deviceId, device: $device, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInfoEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.package, package) || other.package == package));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, device, package);

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInfoEntityImplCopyWith<_$AppInfoEntityImpl> get copyWith =>
      __$$AppInfoEntityImplCopyWithImpl<_$AppInfoEntityImpl>(this, _$identity);
}

abstract class _AppInfoEntity extends AppInfoEntity {
  const factory _AppInfoEntity(
      {required final String deviceId,
      required final DeviceInfoEntity device,
      required final PackageInfoEntity package}) = _$AppInfoEntityImpl;
  const _AppInfoEntity._() : super._();

  @override
  String get deviceId;
  @override
  DeviceInfoEntity get device;
  @override
  PackageInfoEntity get package;

  /// Create a copy of AppInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppInfoEntityImplCopyWith<_$AppInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
