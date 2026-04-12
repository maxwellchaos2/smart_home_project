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
    required TResult Function(_ActionEntity value) changeDevice,
    required TResult Function(_ActionEntityChangeOutputValue value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionEntity value)? changeDevice,
    TResult? Function(_ActionEntityChangeOutputValue value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionEntity value)? changeDevice,
    TResult Function(_ActionEntityChangeOutputValue value)? delay,
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
abstract class _$$ActionEntityImplCopyWith<$Res> {
  factory _$$ActionEntityImplCopyWith(
          _$ActionEntityImpl value, $Res Function(_$ActionEntityImpl) then) =
      __$$ActionEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId, bool? state});
}

/// @nodoc
class __$$ActionEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionEntityImpl>
    implements _$$ActionEntityImplCopyWith<$Res> {
  __$$ActionEntityImplCopyWithImpl(
      _$ActionEntityImpl _value, $Res Function(_$ActionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? state = freezed,
  }) {
    return _then(_$ActionEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ActionEntityImpl extends _ActionEntity {
  const _$ActionEntityImpl({required this.deviceId, required this.state})
      : super._();

  @override
  final String deviceId;
  @override
  final bool? state;

  @override
  String toString() {
    return 'ActionEntity.changeDevice(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      __$$ActionEntityImplCopyWithImpl<_$ActionEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionEntity value) changeDevice,
    required TResult Function(_ActionEntityChangeOutputValue value) delay,
  }) {
    return changeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionEntity value)? changeDevice,
    TResult? Function(_ActionEntityChangeOutputValue value)? delay,
  }) {
    return changeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionEntity value)? changeDevice,
    TResult Function(_ActionEntityChangeOutputValue value)? delay,
    required TResult orElse(),
  }) {
    if (changeDevice != null) {
      return changeDevice(this);
    }
    return orElse();
  }
}

abstract class _ActionEntity extends ActionEntity {
  const factory _ActionEntity(
      {required final String deviceId,
      required final bool? state}) = _$ActionEntityImpl;
  const _ActionEntity._() : super._();

  String get deviceId;
  bool? get state;
  @JsonKey(ignore: true)
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionEntityChangeOutputValueImplCopyWith<$Res> {
  factory _$$ActionEntityChangeOutputValueImplCopyWith(
          _$ActionEntityChangeOutputValueImpl value,
          $Res Function(_$ActionEntityChangeOutputValueImpl) then) =
      __$$ActionEntityChangeOutputValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class __$$ActionEntityChangeOutputValueImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res,
        _$ActionEntityChangeOutputValueImpl>
    implements _$$ActionEntityChangeOutputValueImplCopyWith<$Res> {
  __$$ActionEntityChangeOutputValueImplCopyWithImpl(
      _$ActionEntityChangeOutputValueImpl _value,
      $Res Function(_$ActionEntityChangeOutputValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$ActionEntityChangeOutputValueImpl(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ActionEntityChangeOutputValueImpl
    extends _ActionEntityChangeOutputValue {
  const _$ActionEntityChangeOutputValueImpl({required this.seconds})
      : super._();

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
            other is _$ActionEntityChangeOutputValueImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionEntityChangeOutputValueImplCopyWith<
          _$ActionEntityChangeOutputValueImpl>
      get copyWith => __$$ActionEntityChangeOutputValueImplCopyWithImpl<
          _$ActionEntityChangeOutputValueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionEntity value) changeDevice,
    required TResult Function(_ActionEntityChangeOutputValue value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionEntity value)? changeDevice,
    TResult? Function(_ActionEntityChangeOutputValue value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionEntity value)? changeDevice,
    TResult Function(_ActionEntityChangeOutputValue value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }
}

abstract class _ActionEntityChangeOutputValue extends ActionEntity {
  const factory _ActionEntityChangeOutputValue({required final int seconds}) =
      _$ActionEntityChangeOutputValueImpl;
  const _ActionEntityChangeOutputValue._() : super._();

  int get seconds;
  @JsonKey(ignore: true)
  _$$ActionEntityChangeOutputValueImplCopyWith<
          _$ActionEntityChangeOutputValueImpl>
      get copyWith => throw _privateConstructorUsedError;
}
