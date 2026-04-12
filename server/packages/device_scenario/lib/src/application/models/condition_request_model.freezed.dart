// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionRequestModel _$ConditionRequestModelFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'logic':
      return _ConditionLogicRequestModel.fromJson(json);
    case 'device_state':
      return ConditionDeviceStateRequestModel.fromJson(json);
    case 'device_state_value':
      return _ConditionDeviceStateValueRequestModel.fromJson(json);
    case 'input_state':
      return _ConditionInputStateRequestModel.fromJson(json);
    case 'device_event':
      return _ConditionDeviceEventRequestModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ConditionRequestModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ConditionRequestModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionLogicRequestModelImpl extends _ConditionLogicRequestModel {
  const _$ConditionLogicRequestModelImpl(
      {required this.logic,
      required final List<ConditionRequestModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  factory _$ConditionLogicRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionLogicRequestModelImplFromJson(json);

  @override
  final String logic;
  final List<ConditionRequestModel> _conditions;
  @override
  List<ConditionRequestModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicRequestModelImpl &&
            (identical(other.logic, logic) || other.logic == logic) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, logic, const DeepCollectionEquality().hash(_conditions));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }
}

abstract class _ConditionLogicRequestModel extends ConditionRequestModel {
  const factory _ConditionLogicRequestModel(
          {required final String logic,
          required final List<ConditionRequestModel> conditions}) =
      _$ConditionLogicRequestModelImpl;
  const _ConditionLogicRequestModel._() : super._();

  factory _ConditionLogicRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConditionLogicRequestModelImpl.fromJson;

  String get logic;
  List<ConditionRequestModel> get conditions;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionDeviceStateRequestModelImpl
    extends ConditionDeviceStateRequestModel {
  const _$ConditionDeviceStateRequestModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state',
        super._();

  factory _$ConditionDeviceStateRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionDeviceStateRequestModelImplFromJson(json);

  @override
  final int deviceId;
  final Map<String, dynamic> _state;
  @override
  Map<String, dynamic> get state {
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_state);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.deviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateRequestModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._state, _state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_state));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) {
    return deviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) {
    return deviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceState != null) {
      return deviceState(this);
    }
    return orElse();
  }
}

abstract class ConditionDeviceStateRequestModel extends ConditionRequestModel {
  const factory ConditionDeviceStateRequestModel(
          {required final int deviceId,
          required final Map<String, dynamic> state}) =
      _$ConditionDeviceStateRequestModelImpl;
  const ConditionDeviceStateRequestModel._() : super._();

  factory ConditionDeviceStateRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConditionDeviceStateRequestModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get state;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionDeviceStateValueRequestModelImpl
    extends _ConditionDeviceStateValueRequestModel {
  const _$ConditionDeviceStateValueRequestModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      required this.operator,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state_value',
        super._();

  factory _$ConditionDeviceStateValueRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionDeviceStateValueRequestModelImplFromJson(json);

  @override
  final int deviceId;
  final Map<String, dynamic> _state;
  @override
  Map<String, dynamic> get state {
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_state);
  }

  @override
  final String operator;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.deviceStateValue(deviceId: $deviceId, state: $state, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateValueRequestModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._state, _state) &&
            (identical(other.operator, operator) ||
                other.operator == operator));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId,
      const DeepCollectionEquality().hash(_state), operator);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) {
    return deviceStateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) {
    return deviceStateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceStateValue != null) {
      return deviceStateValue(this);
    }
    return orElse();
  }
}

abstract class _ConditionDeviceStateValueRequestModel
    extends ConditionRequestModel {
  const factory _ConditionDeviceStateValueRequestModel(
          {required final int deviceId,
          required final Map<String, dynamic> state,
          required final String operator}) =
      _$ConditionDeviceStateValueRequestModelImpl;
  const _ConditionDeviceStateValueRequestModel._() : super._();

  factory _ConditionDeviceStateValueRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$ConditionDeviceStateValueRequestModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get state;
  String get operator;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionInputStateRequestModelImpl
    extends _ConditionInputStateRequestModel {
  const _$ConditionInputStateRequestModelImpl(
      {required this.inputId, required this.state, final String? $type})
      : $type = $type ?? 'input_state',
        super._();

  factory _$ConditionInputStateRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionInputStateRequestModelImplFromJson(json);

  @override
  final int inputId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.inputState(inputId: $inputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionInputStateRequestModelImpl &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inputId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) {
    return inputState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) {
    return inputState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (inputState != null) {
      return inputState(this);
    }
    return orElse();
  }
}

abstract class _ConditionInputStateRequestModel extends ConditionRequestModel {
  const factory _ConditionInputStateRequestModel(
      {required final int inputId,
      required final bool? state}) = _$ConditionInputStateRequestModelImpl;
  const _ConditionInputStateRequestModel._() : super._();

  factory _ConditionInputStateRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConditionInputStateRequestModelImpl.fromJson;

  int get inputId;
  bool? get state;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionDeviceEventRequestModelImpl
    extends _ConditionDeviceEventRequestModel {
  const _$ConditionDeviceEventRequestModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> event,
      final String? $type})
      : _event = event,
        $type = $type ?? 'device_event',
        super._();

  factory _$ConditionDeviceEventRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionDeviceEventRequestModelImplFromJson(json);

  @override
  final int deviceId;
  final Map<String, dynamic> _event;
  @override
  Map<String, dynamic> get event {
    if (_event is EqualUnmodifiableMapView) return _event;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_event);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.deviceEvent(deviceId: $deviceId, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceEventRequestModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._event, _event));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_event));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(ConditionDeviceStateRequestModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueRequestModel value)
        deviceStateValue,
    required TResult Function(_ConditionInputStateRequestModel value)
        inputState,
    required TResult Function(_ConditionDeviceEventRequestModel value)
        deviceEvent,
  }) {
    return deviceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult? Function(_ConditionInputStateRequestModel value)? inputState,
    TResult? Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
  }) {
    return deviceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(ConditionDeviceStateRequestModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueRequestModel value)?
        deviceStateValue,
    TResult Function(_ConditionInputStateRequestModel value)? inputState,
    TResult Function(_ConditionDeviceEventRequestModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceEvent != null) {
      return deviceEvent(this);
    }
    return orElse();
  }
}

abstract class _ConditionDeviceEventRequestModel extends ConditionRequestModel {
  const factory _ConditionDeviceEventRequestModel(
          {required final int deviceId,
          required final Map<String, dynamic> event}) =
      _$ConditionDeviceEventRequestModelImpl;
  const _ConditionDeviceEventRequestModel._() : super._();

  factory _ConditionDeviceEventRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$ConditionDeviceEventRequestModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get event;
}
