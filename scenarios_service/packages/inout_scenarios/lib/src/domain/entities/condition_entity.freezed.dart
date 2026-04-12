// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConditionEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionStateEntity value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionStateEntity value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionStateEntity value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionEntityCopyWith<$Res> {
  factory $ConditionEntityCopyWith(
          ConditionEntity value, $Res Function(ConditionEntity) then) =
      _$ConditionEntityCopyWithImpl<$Res, ConditionEntity>;
}

/// @nodoc
class _$ConditionEntityCopyWithImpl<$Res, $Val extends ConditionEntity>
    implements $ConditionEntityCopyWith<$Res> {
  _$ConditionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConditionLogicEntityImplCopyWith<$Res> {
  factory _$$ConditionLogicEntityImplCopyWith(_$ConditionLogicEntityImpl value,
          $Res Function(_$ConditionLogicEntityImpl) then) =
      __$$ConditionLogicEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConditionLogicType logic, List<ConditionEntity> conditions});
}

/// @nodoc
class __$$ConditionLogicEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res, _$ConditionLogicEntityImpl>
    implements _$$ConditionLogicEntityImplCopyWith<$Res> {
  __$$ConditionLogicEntityImplCopyWithImpl(_$ConditionLogicEntityImpl _value,
      $Res Function(_$ConditionLogicEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logic = null,
    Object? conditions = null,
  }) {
    return _then(_$ConditionLogicEntityImpl(
      logic: null == logic
          ? _value.logic
          : logic // ignore: cast_nullable_to_non_nullable
              as ConditionLogicType,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<ConditionEntity>,
    ));
  }
}

/// @nodoc

class _$ConditionLogicEntityImpl extends ConditionLogicEntity {
  const _$ConditionLogicEntityImpl(
      {required this.logic, required final List<ConditionEntity> conditions})
      : _conditions = conditions,
        super._();

  @override
  final ConditionLogicType logic;
  final List<ConditionEntity> _conditions;
  @override
  List<ConditionEntity> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  String toString() {
    return 'ConditionEntity.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicEntityImpl &&
            (identical(other.logic, logic) || other.logic == logic) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, logic, const DeepCollectionEquality().hash(_conditions));

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionLogicEntityImplCopyWith<_$ConditionLogicEntityImpl>
      get copyWith =>
          __$$ConditionLogicEntityImplCopyWithImpl<_$ConditionLogicEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionStateEntity value) state,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionStateEntity value)? state,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionStateEntity value)? state,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }
}

abstract class ConditionLogicEntity extends ConditionEntity {
  const factory ConditionLogicEntity(
          {required final ConditionLogicType logic,
          required final List<ConditionEntity> conditions}) =
      _$ConditionLogicEntityImpl;
  const ConditionLogicEntity._() : super._();

  ConditionLogicType get logic;
  List<ConditionEntity> get conditions;

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionLogicEntityImplCopyWith<_$ConditionLogicEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionStateEntityImplCopyWith<$Res> {
  factory _$$ConditionStateEntityImplCopyWith(_$ConditionStateEntityImpl value,
          $Res Function(_$ConditionStateEntityImpl) then) =
      __$$ConditionStateEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? inputId, int? outputId, ConditionStateType state});
}

/// @nodoc
class __$$ConditionStateEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res, _$ConditionStateEntityImpl>
    implements _$$ConditionStateEntityImplCopyWith<$Res> {
  __$$ConditionStateEntityImplCopyWithImpl(_$ConditionStateEntityImpl _value,
      $Res Function(_$ConditionStateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputId = freezed,
    Object? outputId = freezed,
    Object? state = null,
  }) {
    return _then(_$ConditionStateEntityImpl(
      inputId: freezed == inputId
          ? _value.inputId
          : inputId // ignore: cast_nullable_to_non_nullable
              as int?,
      outputId: freezed == outputId
          ? _value.outputId
          : outputId // ignore: cast_nullable_to_non_nullable
              as int?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConditionStateType,
    ));
  }
}

/// @nodoc

class _$ConditionStateEntityImpl extends ConditionStateEntity {
  const _$ConditionStateEntityImpl(
      {this.inputId, this.outputId, required this.state})
      : assert(inputId != null || outputId != null),
        super._();

  @override
  final int? inputId;
  @override
  final int? outputId;
  @override
  final ConditionStateType state;

  @override
  String toString() {
    return 'ConditionEntity.state(inputId: $inputId, outputId: $outputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionStateEntityImpl &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputId, outputId, state);

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionStateEntityImplCopyWith<_$ConditionStateEntityImpl>
      get copyWith =>
          __$$ConditionStateEntityImplCopyWithImpl<_$ConditionStateEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionStateEntity value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionStateEntity value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionStateEntity value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class ConditionStateEntity extends ConditionEntity {
  const factory ConditionStateEntity(
      {final int? inputId,
      final int? outputId,
      required final ConditionStateType state}) = _$ConditionStateEntityImpl;
  const ConditionStateEntity._() : super._();

  int? get inputId;
  int? get outputId;
  ConditionStateType get state;

  /// Create a copy of ConditionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionStateEntityImplCopyWith<_$ConditionStateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
