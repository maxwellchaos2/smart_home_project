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
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
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

  @JsonKey(ignore: true)
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
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
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
  @JsonKey(ignore: true)
  _$$ConditionLogicEntityImplCopyWith<_$ConditionLogicEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionDeviceStateEntityImplCopyWith<$Res> {
  factory _$$ConditionDeviceStateEntityImplCopyWith(
          _$ConditionDeviceStateEntityImpl value,
          $Res Function(_$ConditionDeviceStateEntityImpl) then) =
      __$$ConditionDeviceStateEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int deviceId, DeviceCapabilityStateEntity state});

  $DeviceCapabilityStateEntityCopyWith<$Res> get state;
}

/// @nodoc
class __$$ConditionDeviceStateEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res,
        _$ConditionDeviceStateEntityImpl>
    implements _$$ConditionDeviceStateEntityImplCopyWith<$Res> {
  __$$ConditionDeviceStateEntityImplCopyWithImpl(
      _$ConditionDeviceStateEntityImpl _value,
      $Res Function(_$ConditionDeviceStateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? state = null,
  }) {
    return _then(_$ConditionDeviceStateEntityImpl(
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

class _$ConditionDeviceStateEntityImpl extends ConditionDeviceStateEntity {
  const _$ConditionDeviceStateEntityImpl(
      {required this.deviceId, required this.state})
      : super._();

  @override
  final int deviceId;
  @override
  final DeviceCapabilityStateEntity state;

  @override
  String toString() {
    return 'ConditionEntity.deviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionDeviceStateEntityImplCopyWith<_$ConditionDeviceStateEntityImpl>
      get copyWith => __$$ConditionDeviceStateEntityImplCopyWithImpl<
          _$ConditionDeviceStateEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) {
    return deviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) {
    return deviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceState != null) {
      return deviceState(this);
    }
    return orElse();
  }
}

abstract class ConditionDeviceStateEntity extends ConditionEntity {
  const factory ConditionDeviceStateEntity(
          {required final int deviceId,
          required final DeviceCapabilityStateEntity state}) =
      _$ConditionDeviceStateEntityImpl;
  const ConditionDeviceStateEntity._() : super._();

  int get deviceId;
  DeviceCapabilityStateEntity get state;
  @JsonKey(ignore: true)
  _$$ConditionDeviceStateEntityImplCopyWith<_$ConditionDeviceStateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionDeviceStateValueEntityImplCopyWith<$Res> {
  factory _$$ConditionDeviceStateValueEntityImplCopyWith(
          _$ConditionDeviceStateValueEntityImpl value,
          $Res Function(_$ConditionDeviceStateValueEntityImpl) then) =
      __$$ConditionDeviceStateValueEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int deviceId,
      DeviceCapabilityStateEntity state,
      ConditionOperator operator});

  $DeviceCapabilityStateEntityCopyWith<$Res> get state;
}

/// @nodoc
class __$$ConditionDeviceStateValueEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res,
        _$ConditionDeviceStateValueEntityImpl>
    implements _$$ConditionDeviceStateValueEntityImplCopyWith<$Res> {
  __$$ConditionDeviceStateValueEntityImplCopyWithImpl(
      _$ConditionDeviceStateValueEntityImpl _value,
      $Res Function(_$ConditionDeviceStateValueEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? state = null,
    Object? operator = null,
  }) {
    return _then(_$ConditionDeviceStateValueEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as ConditionOperator,
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

class _$ConditionDeviceStateValueEntityImpl
    extends ConditionDeviceStateValueEntity {
  const _$ConditionDeviceStateValueEntityImpl(
      {required this.deviceId, required this.state, required this.operator})
      : super._();

  @override
  final int deviceId;
  @override
  final DeviceCapabilityStateEntity state;
  @override
  final ConditionOperator operator;

  @override
  String toString() {
    return 'ConditionEntity.deviceStateValue(deviceId: $deviceId, state: $state, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateValueEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.operator, operator) ||
                other.operator == operator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state, operator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionDeviceStateValueEntityImplCopyWith<
          _$ConditionDeviceStateValueEntityImpl>
      get copyWith => __$$ConditionDeviceStateValueEntityImplCopyWithImpl<
          _$ConditionDeviceStateValueEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) {
    return deviceStateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) {
    return deviceStateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceStateValue != null) {
      return deviceStateValue(this);
    }
    return orElse();
  }
}

abstract class ConditionDeviceStateValueEntity extends ConditionEntity {
  const factory ConditionDeviceStateValueEntity(
          {required final int deviceId,
          required final DeviceCapabilityStateEntity state,
          required final ConditionOperator operator}) =
      _$ConditionDeviceStateValueEntityImpl;
  const ConditionDeviceStateValueEntity._() : super._();

  int get deviceId;
  DeviceCapabilityStateEntity get state;
  ConditionOperator get operator;
  @JsonKey(ignore: true)
  _$$ConditionDeviceStateValueEntityImplCopyWith<
          _$ConditionDeviceStateValueEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionDeviceEventEntityImplCopyWith<$Res> {
  factory _$$ConditionDeviceEventEntityImplCopyWith(
          _$ConditionDeviceEventEntityImpl value,
          $Res Function(_$ConditionDeviceEventEntityImpl) then) =
      __$$ConditionDeviceEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int deviceId, ({String key, String? value}) event});
}

/// @nodoc
class __$$ConditionDeviceEventEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res,
        _$ConditionDeviceEventEntityImpl>
    implements _$$ConditionDeviceEventEntityImplCopyWith<$Res> {
  __$$ConditionDeviceEventEntityImplCopyWithImpl(
      _$ConditionDeviceEventEntityImpl _value,
      $Res Function(_$ConditionDeviceEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? event = null,
  }) {
    return _then(_$ConditionDeviceEventEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as ({String key, String? value}),
    ));
  }
}

/// @nodoc

class _$ConditionDeviceEventEntityImpl extends ConditionDeviceEventEntity {
  const _$ConditionDeviceEventEntityImpl(
      {required this.deviceId, required this.event})
      : super._();

  @override
  final int deviceId;
  @override
  final ({String key, String? value}) event;

  @override
  String toString() {
    return 'ConditionEntity.deviceEvent(deviceId: $deviceId, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceEventEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionDeviceEventEntityImplCopyWith<_$ConditionDeviceEventEntityImpl>
      get copyWith => __$$ConditionDeviceEventEntityImplCopyWithImpl<
          _$ConditionDeviceEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) {
    return deviceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) {
    return deviceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceEvent != null) {
      return deviceEvent(this);
    }
    return orElse();
  }
}

abstract class ConditionDeviceEventEntity extends ConditionEntity {
  const factory ConditionDeviceEventEntity(
          {required final int deviceId,
          required final ({String key, String? value}) event}) =
      _$ConditionDeviceEventEntityImpl;
  const ConditionDeviceEventEntity._() : super._();

  int get deviceId;
  ({String key, String? value}) get event;
  @JsonKey(ignore: true)
  _$$ConditionDeviceEventEntityImplCopyWith<_$ConditionDeviceEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionInputStateEntityImplCopyWith<$Res> {
  factory _$$ConditionInputStateEntityImplCopyWith(
          _$ConditionInputStateEntityImpl value,
          $Res Function(_$ConditionInputStateEntityImpl) then) =
      __$$ConditionInputStateEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int inputId, ConditionInputStateType state});
}

/// @nodoc
class __$$ConditionInputStateEntityImplCopyWithImpl<$Res>
    extends _$ConditionEntityCopyWithImpl<$Res, _$ConditionInputStateEntityImpl>
    implements _$$ConditionInputStateEntityImplCopyWith<$Res> {
  __$$ConditionInputStateEntityImplCopyWithImpl(
      _$ConditionInputStateEntityImpl _value,
      $Res Function(_$ConditionInputStateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputId = null,
    Object? state = null,
  }) {
    return _then(_$ConditionInputStateEntityImpl(
      inputId: null == inputId
          ? _value.inputId
          : inputId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConditionInputStateType,
    ));
  }
}

/// @nodoc

class _$ConditionInputStateEntityImpl extends ConditionInputStateEntity {
  const _$ConditionInputStateEntityImpl(
      {required this.inputId, required this.state})
      : super._();

  @override
  final int inputId;
  @override
  final ConditionInputStateType state;

  @override
  String toString() {
    return 'ConditionEntity.inputState(inputId: $inputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionInputStateEntityImpl &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionInputStateEntityImplCopyWith<_$ConditionInputStateEntityImpl>
      get copyWith => __$$ConditionInputStateEntityImplCopyWithImpl<
          _$ConditionInputStateEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionLogicEntity value) logic,
    required TResult Function(ConditionDeviceStateEntity value) deviceState,
    required TResult Function(ConditionDeviceStateValueEntity value)
        deviceStateValue,
    required TResult Function(ConditionDeviceEventEntity value) deviceEvent,
    required TResult Function(ConditionInputStateEntity value) inputState,
  }) {
    return inputState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionLogicEntity value)? logic,
    TResult? Function(ConditionDeviceStateEntity value)? deviceState,
    TResult? Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult? Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult? Function(ConditionInputStateEntity value)? inputState,
  }) {
    return inputState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionLogicEntity value)? logic,
    TResult Function(ConditionDeviceStateEntity value)? deviceState,
    TResult Function(ConditionDeviceStateValueEntity value)? deviceStateValue,
    TResult Function(ConditionDeviceEventEntity value)? deviceEvent,
    TResult Function(ConditionInputStateEntity value)? inputState,
    required TResult orElse(),
  }) {
    if (inputState != null) {
      return inputState(this);
    }
    return orElse();
  }
}

abstract class ConditionInputStateEntity extends ConditionEntity {
  const factory ConditionInputStateEntity(
          {required final int inputId,
          required final ConditionInputStateType state}) =
      _$ConditionInputStateEntityImpl;
  const ConditionInputStateEntity._() : super._();

  int get inputId;
  ConditionInputStateType get state;
  @JsonKey(ignore: true)
  _$$ConditionInputStateEntityImplCopyWith<_$ConditionInputStateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
