// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConditionResponseModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ConditionResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionLogicResponseModelImpl extends _ConditionLogicResponseModel {
  const _$ConditionLogicResponseModelImpl(
      {required this.logic,
      required final List<ConditionResponseModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  @override
  final String logic;
  final List<ConditionResponseModel> _conditions;
  @override
  List<ConditionResponseModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionResponseModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionLogicResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionLogicResponseModel extends ConditionResponseModel {
  const factory _ConditionLogicResponseModel(
          {required final String logic,
          required final List<ConditionResponseModel> conditions}) =
      _$ConditionLogicResponseModelImpl;
  const _ConditionLogicResponseModel._() : super._();

  String get logic;
  List<ConditionResponseModel> get conditions;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionInputStateResponseModelImpl
    extends _ConditionInputStateResponseModel {
  const _$ConditionInputStateResponseModelImpl(
      {required this.inputId, required this.state, final String? $type})
      : $type = $type ?? 'input_state',
        super._();

  @override
  final int inputId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionResponseModel.inputState(inputId: $inputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionInputStateResponseModelImpl &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inputId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) {
    return inputState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) {
    return inputState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (inputState != null) {
      return inputState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionInputStateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionInputStateResponseModel
    extends ConditionResponseModel {
  const factory _ConditionInputStateResponseModel(
      {required final int inputId,
      required final bool? state}) = _$ConditionInputStateResponseModelImpl;
  const _ConditionInputStateResponseModel._() : super._();

  int get inputId;
  bool? get state;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionDeviceStateResponseModelImpl
    extends _ConditionDeviceStateResponseModel {
  const _$ConditionDeviceStateResponseModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state',
        super._();

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
    return 'ConditionResponseModel.deviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) {
    return deviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) {
    return deviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceState != null) {
      return deviceState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceStateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceStateResponseModel
    extends ConditionResponseModel {
  const factory _ConditionDeviceStateResponseModel(
          {required final int deviceId,
          required final Map<String, dynamic> state}) =
      _$ConditionDeviceStateResponseModelImpl;
  const _ConditionDeviceStateResponseModel._() : super._();

  int get deviceId;
  Map<String, dynamic> get state;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionDeviceStateValueResponseModelImpl
    extends _ConditionDeviceStateValueResponseModel {
  const _$ConditionDeviceStateValueResponseModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      required this.operator,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state_value',
        super._();

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
    return 'ConditionResponseModel.deviceStateValue(deviceId: $deviceId, state: $state, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateValueResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) {
    return deviceStateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) {
    return deviceStateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceStateValue != null) {
      return deviceStateValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceStateValueResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceStateValueResponseModel
    extends ConditionResponseModel {
  const factory _ConditionDeviceStateValueResponseModel(
          {required final int deviceId,
          required final Map<String, dynamic> state,
          required final String operator}) =
      _$ConditionDeviceStateValueResponseModelImpl;
  const _ConditionDeviceStateValueResponseModel._() : super._();

  int get deviceId;
  Map<String, dynamic> get state;
  String get operator;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionDeviceEventResponseModelImpl
    extends _ConditionDeviceEventResponseModel {
  const _$ConditionDeviceEventResponseModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> event,
      final String? $type})
      : _event = event,
        $type = $type ?? 'device_event',
        super._();

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
    return 'ConditionResponseModel.deviceEvent(deviceId: $deviceId, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceEventResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionInputStateResponseModel value)
        inputState,
    required TResult Function(_ConditionDeviceStateResponseModel value)
        deviceState,
    required TResult Function(_ConditionDeviceStateValueResponseModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventResponseModel value)
        deviceEvent,
  }) {
    return deviceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionInputStateResponseModel value)? inputState,
    TResult? Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult? Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
  }) {
    return deviceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionInputStateResponseModel value)? inputState,
    TResult Function(_ConditionDeviceStateResponseModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueResponseModel value)?
        deviceStateValue,
    TResult Function(_ConditionDeviceEventResponseModel value)? deviceEvent,
    required TResult orElse(),
  }) {
    if (deviceEvent != null) {
      return deviceEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceEventResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceEventResponseModel
    extends ConditionResponseModel {
  const factory _ConditionDeviceEventResponseModel(
          {required final int deviceId,
          required final Map<String, dynamic> event}) =
      _$ConditionDeviceEventResponseModelImpl;
  const _ConditionDeviceEventResponseModel._() : super._();

  int get deviceId;
  Map<String, dynamic> get event;
}
