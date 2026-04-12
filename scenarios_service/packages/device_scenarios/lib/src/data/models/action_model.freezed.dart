// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionModel _$ActionModelFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'change_device_state':
      return _ActionChangeDeviceStateModel.fromJson(json);
    case 'delay':
      return _ActionDelayModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'ActionModel', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ActionModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeDeviceStateModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayModel value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult? Function(_ActionDelayModel value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult Function(_ActionDelayModel value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$ActionChangeDeviceStateModelImpl extends _ActionChangeDeviceStateModel {
  const _$ActionChangeDeviceStateModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      final String? $type})
      : _state = state,
        $type = $type ?? 'change_device_state',
        super._();

  factory _$ActionChangeDeviceStateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActionChangeDeviceStateModelImplFromJson(json);

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
    return 'ActionModel.changeDeviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionChangeDeviceStateModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._state, _state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_state));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeDeviceStateModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayModel value) delay,
  }) {
    return changeDeviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult? Function(_ActionDelayModel value)? delay,
  }) {
    return changeDeviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult Function(_ActionDelayModel value)? delay,
    required TResult orElse(),
  }) {
    if (changeDeviceState != null) {
      return changeDeviceState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionChangeDeviceStateModelImplToJson(
      this,
    );
  }
}

abstract class _ActionChangeDeviceStateModel extends ActionModel {
  const factory _ActionChangeDeviceStateModel(
          {required final int deviceId,
          required final Map<String, dynamic> state}) =
      _$ActionChangeDeviceStateModelImpl;
  const _ActionChangeDeviceStateModel._() : super._();

  factory _ActionChangeDeviceStateModel.fromJson(Map<String, dynamic> json) =
      _$ActionChangeDeviceStateModelImpl.fromJson;

  int get deviceId;
  Map<String, dynamic> get state;
}

/// @nodoc
@JsonSerializable()
class _$ActionDelayModelImpl extends _ActionDelayModel {
  const _$ActionDelayModelImpl({required this.seconds, final String? $type})
      : $type = $type ?? 'delay',
        super._();

  factory _$ActionDelayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionDelayModelImplFromJson(json);

  @override
  final int seconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ActionModel.delay(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionDelayModelImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeDeviceStateModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayModel value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult? Function(_ActionDelayModel value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateModel value)? changeDeviceState,
    TResult Function(_ActionDelayModel value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionDelayModelImplToJson(
      this,
    );
  }
}

abstract class _ActionDelayModel extends ActionModel {
  const factory _ActionDelayModel({required final int seconds}) =
      _$ActionDelayModelImpl;
  const _ActionDelayModel._() : super._();

  factory _ActionDelayModel.fromJson(Map<String, dynamic> json) =
      _$ActionDelayModelImpl.fromJson;

  int get seconds;
}
