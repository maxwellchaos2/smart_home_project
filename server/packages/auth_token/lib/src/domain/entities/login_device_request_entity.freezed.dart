// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_device_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginDeviceRequestEntity {
  int get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginDeviceRequestEntityCopyWith<LoginDeviceRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDeviceRequestEntityCopyWith<$Res> {
  factory $LoginDeviceRequestEntityCopyWith(LoginDeviceRequestEntity value,
          $Res Function(LoginDeviceRequestEntity) then) =
      _$LoginDeviceRequestEntityCopyWithImpl<$Res, LoginDeviceRequestEntity>;
  @useResult
  $Res call({int deviceId});
}

/// @nodoc
class _$LoginDeviceRequestEntityCopyWithImpl<$Res,
        $Val extends LoginDeviceRequestEntity>
    implements $LoginDeviceRequestEntityCopyWith<$Res> {
  _$LoginDeviceRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDeviceRequestEntityImplCopyWith<$Res>
    implements $LoginDeviceRequestEntityCopyWith<$Res> {
  factory _$$LoginDeviceRequestEntityImplCopyWith(
          _$LoginDeviceRequestEntityImpl value,
          $Res Function(_$LoginDeviceRequestEntityImpl) then) =
      __$$LoginDeviceRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int deviceId});
}

/// @nodoc
class __$$LoginDeviceRequestEntityImplCopyWithImpl<$Res>
    extends _$LoginDeviceRequestEntityCopyWithImpl<$Res,
        _$LoginDeviceRequestEntityImpl>
    implements _$$LoginDeviceRequestEntityImplCopyWith<$Res> {
  __$$LoginDeviceRequestEntityImplCopyWithImpl(
      _$LoginDeviceRequestEntityImpl _value,
      $Res Function(_$LoginDeviceRequestEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$LoginDeviceRequestEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoginDeviceRequestEntityImpl extends _LoginDeviceRequestEntity {
  const _$LoginDeviceRequestEntityImpl({required this.deviceId}) : super._();

  @override
  final int deviceId;

  @override
  String toString() {
    return 'LoginDeviceRequestEntity(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDeviceRequestEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDeviceRequestEntityImplCopyWith<_$LoginDeviceRequestEntityImpl>
      get copyWith => __$$LoginDeviceRequestEntityImplCopyWithImpl<
          _$LoginDeviceRequestEntityImpl>(this, _$identity);
}

abstract class _LoginDeviceRequestEntity extends LoginDeviceRequestEntity {
  const factory _LoginDeviceRequestEntity({required final int deviceId}) =
      _$LoginDeviceRequestEntityImpl;
  const _LoginDeviceRequestEntity._() : super._();

  @override
  int get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$LoginDeviceRequestEntityImplCopyWith<_$LoginDeviceRequestEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
