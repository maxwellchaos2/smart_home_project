// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActionChangeDeviceStateEntity value)
        changeDeviceState,
    required TResult Function(ActionDelayEntity value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult? Function(ActionDelayEntity value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult Function(ActionDelayEntity value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionEntityCopyWith<$Res> {
  factory $ActionEntityCopyWith(
          ActionEntity value, $Res Function(ActionEntity) then) =
      _$ActionEntityCopyWithImpl<$Res, ActionEntity>;
}

/// @nodoc
class _$ActionEntityCopyWithImpl<$Res, $Val extends ActionEntity>
    implements $ActionEntityCopyWith<$Res> {
  _$ActionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ActionChangeDeviceStateEntityImplCopyWith<$Res> {
  factory _$$ActionChangeDeviceStateEntityImplCopyWith(
          _$ActionChangeDeviceStateEntityImpl value,
          $Res Function(_$ActionChangeDeviceStateEntityImpl) then) =
      __$$ActionChangeDeviceStateEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int deviceId, DeviceCapabilityStateEntity state});

  $DeviceCapabilityStateEntityCopyWith<$Res> get state;
}

/// @nodoc
class __$$ActionChangeDeviceStateEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res,
        _$ActionChangeDeviceStateEntityImpl>
    implements _$$ActionChangeDeviceStateEntityImplCopyWith<$Res> {
  __$$ActionChangeDeviceStateEntityImplCopyWithImpl(
      _$ActionChangeDeviceStateEntityImpl _value,
      $Res Function(_$ActionChangeDeviceStateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? state = null,
  }) {
    return _then(_$ActionChangeDeviceStateEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceCapabilityStateEntityCopyWith<$Res> get state {
    return $DeviceCapabilityStateEntityCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ActionChangeDeviceStateEntityImpl
    extends ActionChangeDeviceStateEntity {
  const _$ActionChangeDeviceStateEntityImpl(
      {required this.deviceId, required this.state})
      : super._();

  @override
  final int deviceId;
  @override
  final DeviceCapabilityStateEntity state;

  @override
  String toString() {
    return 'ActionEntity.changeDeviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionChangeDeviceStateEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionChangeDeviceStateEntityImplCopyWith<
          _$ActionChangeDeviceStateEntityImpl>
      get copyWith => __$$ActionChangeDeviceStateEntityImplCopyWithImpl<
          _$ActionChangeDeviceStateEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActionChangeDeviceStateEntity value)
        changeDeviceState,
    required TResult Function(ActionDelayEntity value) delay,
  }) {
    return changeDeviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult? Function(ActionDelayEntity value)? delay,
  }) {
    return changeDeviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult Function(ActionDelayEntity value)? delay,
    required TResult orElse(),
  }) {
    if (changeDeviceState != null) {
      return changeDeviceState(this);
    }
    return orElse();
  }
}

abstract class ActionChangeDeviceStateEntity extends ActionEntity {
  const factory ActionChangeDeviceStateEntity(
          {required final int deviceId,
          required final DeviceCapabilityStateEntity state}) =
      _$ActionChangeDeviceStateEntityImpl;
  const ActionChangeDeviceStateEntity._() : super._();

  int get deviceId;
  DeviceCapabilityStateEntity get state;
  @JsonKey(ignore: true)
  _$$ActionChangeDeviceStateEntityImplCopyWith<
          _$ActionChangeDeviceStateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionDelayEntityImplCopyWith<$Res> {
  factory _$$ActionDelayEntityImplCopyWith(_$ActionDelayEntityImpl value,
          $Res Function(_$ActionDelayEntityImpl) then) =
      __$$ActionDelayEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class __$$ActionDelayEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionDelayEntityImpl>
    implements _$$ActionDelayEntityImplCopyWith<$Res> {
  __$$ActionDelayEntityImplCopyWithImpl(_$ActionDelayEntityImpl _value,
      $Res Function(_$ActionDelayEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$ActionDelayEntityImpl(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ActionDelayEntityImpl extends ActionDelayEntity {
  const _$ActionDelayEntityImpl({required this.seconds}) : super._();

  @override
  final int seconds;

  @override
  String toString() {
    return 'ActionEntity.delay(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionDelayEntityImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionDelayEntityImplCopyWith<_$ActionDelayEntityImpl> get copyWith =>
      __$$ActionDelayEntityImplCopyWithImpl<_$ActionDelayEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActionChangeDeviceStateEntity value)
        changeDeviceState,
    required TResult Function(ActionDelayEntity value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult? Function(ActionDelayEntity value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeDeviceStateEntity value)? changeDeviceState,
    TResult Function(ActionDelayEntity value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }
}

abstract class ActionDelayEntity extends ActionEntity {
  const factory ActionDelayEntity({required final int seconds}) =
      _$ActionDelayEntityImpl;
  const ActionDelayEntity._() : super._();

  int get seconds;
  @JsonKey(ignore: true)
  _$$ActionDelayEntityImplCopyWith<_$ActionDelayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
