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
    required TResult Function(ActionChangeOutputEntity value) changeOutput,
    required TResult Function(ActionDelayEntity value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeOutputEntity value)? changeOutput,
    TResult? Function(ActionDelayEntity value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeOutputEntity value)? changeOutput,
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

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ActionChangeOutputEntityImplCopyWith<$Res> {
  factory _$$ActionChangeOutputEntityImplCopyWith(
          _$ActionChangeOutputEntityImpl value,
          $Res Function(_$ActionChangeOutputEntityImpl) then) =
      __$$ActionChangeOutputEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int outputId, bool? state});
}

/// @nodoc
class __$$ActionChangeOutputEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionChangeOutputEntityImpl>
    implements _$$ActionChangeOutputEntityImplCopyWith<$Res> {
  __$$ActionChangeOutputEntityImplCopyWithImpl(
      _$ActionChangeOutputEntityImpl _value,
      $Res Function(_$ActionChangeOutputEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputId = null,
    Object? state = freezed,
  }) {
    return _then(_$ActionChangeOutputEntityImpl(
      outputId: null == outputId
          ? _value.outputId
          : outputId // ignore: cast_nullable_to_non_nullable
              as int,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ActionChangeOutputEntityImpl extends ActionChangeOutputEntity {
  const _$ActionChangeOutputEntityImpl(
      {required this.outputId, required this.state})
      : super._();

  @override
  final int outputId;
  @override
  final bool? state;

  @override
  String toString() {
    return 'ActionEntity.changeOutput(outputId: $outputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionChangeOutputEntityImpl &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outputId, state);

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionChangeOutputEntityImplCopyWith<_$ActionChangeOutputEntityImpl>
      get copyWith => __$$ActionChangeOutputEntityImplCopyWithImpl<
          _$ActionChangeOutputEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActionChangeOutputEntity value) changeOutput,
    required TResult Function(ActionDelayEntity value) delay,
  }) {
    return changeOutput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeOutputEntity value)? changeOutput,
    TResult? Function(ActionDelayEntity value)? delay,
  }) {
    return changeOutput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeOutputEntity value)? changeOutput,
    TResult Function(ActionDelayEntity value)? delay,
    required TResult orElse(),
  }) {
    if (changeOutput != null) {
      return changeOutput(this);
    }
    return orElse();
  }
}

abstract class ActionChangeOutputEntity extends ActionEntity {
  const factory ActionChangeOutputEntity(
      {required final int outputId,
      required final bool? state}) = _$ActionChangeOutputEntityImpl;
  const ActionChangeOutputEntity._() : super._();

  int get outputId;
  bool? get state;

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionChangeOutputEntityImplCopyWith<_$ActionChangeOutputEntityImpl>
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

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionDelayEntityImplCopyWith<_$ActionDelayEntityImpl> get copyWith =>
      __$$ActionDelayEntityImplCopyWithImpl<_$ActionDelayEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActionChangeOutputEntity value) changeOutput,
    required TResult Function(ActionDelayEntity value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActionChangeOutputEntity value)? changeOutput,
    TResult? Function(ActionDelayEntity value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActionChangeOutputEntity value)? changeOutput,
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

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionDelayEntityImplCopyWith<_$ActionDelayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
