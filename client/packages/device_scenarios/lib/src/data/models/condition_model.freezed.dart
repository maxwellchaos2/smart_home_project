// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'logic':
      return _ConditionLogicModel.fromJson(json);
    case 'device_state':
      return _ConditionDeviceStateModel.fromJson(json);
    case 'device_state_value':
      return _ConditionDeviceStateValueModel.fromJson(json);
    case 'device_event':
      return _ConditionDeviceEventModel.fromJson(json);
    case 'input_state':
      return _ConditionInputStateModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ConditionModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ConditionModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ConditionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$ConditionLogicModelImpl extends _ConditionLogicModel {
  const _$ConditionLogicModelImpl(
      {required this.logic,
      required final List<ConditionModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  factory _$ConditionLogicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionLogicModelImplFromJson(json);

  @override
  final String logic;
  final List<ConditionModel> _conditions;
  @override
  List<ConditionModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicModelImpl &&
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
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionLogicModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionLogicModel extends ConditionModel {
  const factory _ConditionLogicModel(
          {required final String logic,
          required final List<ConditionModel> conditions}) =
      _$ConditionLogicModelImpl;
  const _ConditionLogicModel._() : super._();

  factory _ConditionLogicModel.fromJson(Map<String, dynamic> json) =
      _$ConditionLogicModelImpl.fromJson;

  String get logic;
  List<ConditionModel> get conditions;
}

/// @nodoc
@JsonSerializable()
class _$ConditionDeviceStateModelImpl extends _ConditionDeviceStateModel {
  const _$ConditionDeviceStateModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state',
        super._();

  factory _$ConditionDeviceStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionDeviceStateModelImplFromJson(json);

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
    return 'ConditionModel.deviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateModelImpl &&
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
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) {
    return deviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) {
    return deviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceState != null) {
      return deviceState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceStateModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceStateModel extends ConditionModel {
  const factory _ConditionDeviceStateModel(
          {required final int deviceId,
          required final Map<String, dynamic> state}) =
      _$ConditionDeviceStateModelImpl;
  const _ConditionDeviceStateModel._() : super._();

  factory _ConditionDeviceStateModel.fromJson(Map<String, dynamic> json) =
      _$ConditionDeviceStateModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get state;
}

/// @nodoc
@JsonSerializable()
class _$ConditionDeviceStateValueModelImpl
    extends _ConditionDeviceStateValueModel {
  const _$ConditionDeviceStateValueModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      required this.operator,
      final String? $type})
      : _state = state,
        $type = $type ?? 'device_state_value',
        super._();

  factory _$ConditionDeviceStateValueModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionDeviceStateValueModelImplFromJson(json);

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
    return 'ConditionModel.deviceStateValue(deviceId: $deviceId, state: $state, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceStateValueModelImpl &&
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
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) {
    return deviceStateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) {
    return deviceStateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceStateValue != null) {
      return deviceStateValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceStateValueModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceStateValueModel extends ConditionModel {
  const factory _ConditionDeviceStateValueModel(
      {required final int deviceId,
      required final Map<String, dynamic> state,
      required final String operator}) = _$ConditionDeviceStateValueModelImpl;
  const _ConditionDeviceStateValueModel._() : super._();

  factory _ConditionDeviceStateValueModel.fromJson(Map<String, dynamic> json) =
      _$ConditionDeviceStateValueModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get state;
  String get operator;
}

/// @nodoc
@JsonSerializable()
class _$ConditionDeviceEventModelImpl extends _ConditionDeviceEventModel {
  const _$ConditionDeviceEventModelImpl(
      {required this.deviceId,
      required final Map<String, String?> event,
      final String? $type})
      : _event = event,
        $type = $type ?? 'device_event',
        super._();

  factory _$ConditionDeviceEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionDeviceEventModelImplFromJson(json);

  @override
  final int deviceId;
  final Map<String, String?> _event;
  @override
  Map<String, String?> get event {
    if (_event is EqualUnmodifiableMapView) return _event;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_event);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionModel.deviceEvent(deviceId: $deviceId, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDeviceEventModelImpl &&
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
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) {
    return deviceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) {
    return deviceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) {
    if (deviceEvent != null) {
      return deviceEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDeviceEventModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionDeviceEventModel extends ConditionModel {
  const factory _ConditionDeviceEventModel(
          {required final int deviceId,
          required final Map<String, String?> event}) =
      _$ConditionDeviceEventModelImpl;
  const _ConditionDeviceEventModel._() : super._();

  factory _ConditionDeviceEventModel.fromJson(Map<String, dynamic> json) =
      _$ConditionDeviceEventModelImpl.fromJson;

  int get deviceId;
  Map<String, String?> get event;
}

/// @nodoc
@JsonSerializable()
class _$ConditionInputStateModelImpl extends _ConditionInputStateModel {
  const _$ConditionInputStateModelImpl(
      {required this.inputId, required this.state, final String? $type})
      : $type = $type ?? 'input_state',
        super._();

  factory _$ConditionInputStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionInputStateModelImplFromJson(json);

  @override
  final int inputId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionModel.inputState(inputId: $inputId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionInputStateModelImpl &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inputId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionDeviceStateModel value) deviceState,
    required TResult Function(_ConditionDeviceStateValueModel value)
        deviceStateValue,
    required TResult Function(_ConditionDeviceEventModel value) deviceEvent,
    required TResult Function(_ConditionInputStateModel value) inputState,
  }) {
    return inputState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionDeviceStateModel value)? deviceState,
    TResult? Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult? Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult? Function(_ConditionInputStateModel value)? inputState,
  }) {
    return inputState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionDeviceStateModel value)? deviceState,
    TResult Function(_ConditionDeviceStateValueModel value)? deviceStateValue,
    TResult Function(_ConditionDeviceEventModel value)? deviceEvent,
    TResult Function(_ConditionInputStateModel value)? inputState,
    required TResult orElse(),
  }) {
    if (inputState != null) {
      return inputState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionInputStateModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionInputStateModel extends ConditionModel {
  const factory _ConditionInputStateModel(
      {required final int inputId,
      required final bool? state}) = _$ConditionInputStateModelImpl;
  const _ConditionInputStateModel._() : super._();

  factory _ConditionInputStateModel.fromJson(Map<String, dynamic> json) =
      _$ConditionInputStateModelImpl.fromJson;

  int get inputId;
  bool? get state;
}
