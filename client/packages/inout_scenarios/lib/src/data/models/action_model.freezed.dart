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
    case 'changeDevice':
      return _ChangeDevice.fromJson(json);
    case 'delay':
      return _Delay.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'ActionModel', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ActionModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDevice value) changeDevice,
    required TResult Function(_Delay value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDevice value)? changeDevice,
    TResult? Function(_Delay value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDevice value)? changeDevice,
    TResult Function(_Delay value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ActionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$ChangeDeviceImpl extends _ChangeDevice {
  const _$ChangeDeviceImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'changeDevice',
        super._();

  factory _$ChangeDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeDeviceImplFromJson(json);

  @override
  final String deviceId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ActionModel.changeDevice(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDeviceImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDevice value) changeDevice,
    required TResult Function(_Delay value) delay,
  }) {
    return changeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDevice value)? changeDevice,
    TResult? Function(_Delay value)? delay,
  }) {
    return changeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDevice value)? changeDevice,
    TResult Function(_Delay value)? delay,
    required TResult orElse(),
  }) {
    if (changeDevice != null) {
      return changeDevice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeDeviceImplToJson(
      this,
    );
  }
}

abstract class _ChangeDevice extends ActionModel {
  const factory _ChangeDevice(
      {required final String deviceId,
      required final bool? state}) = _$ChangeDeviceImpl;
  const _ChangeDevice._() : super._();

  factory _ChangeDevice.fromJson(Map<String, dynamic> json) =
      _$ChangeDeviceImpl.fromJson;

  String get deviceId;
  bool? get state;
}

/// @nodoc
@JsonSerializable()
class _$DelayImpl extends _Delay {
  const _$DelayImpl({required this.seconds, final String? $type})
      : $type = $type ?? 'delay',
        super._();

  factory _$DelayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DelayImplFromJson(json);

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
            other is _$DelayImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDevice value) changeDevice,
    required TResult Function(_Delay value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeDevice value)? changeDevice,
    TResult? Function(_Delay value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDevice value)? changeDevice,
    TResult Function(_Delay value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DelayImplToJson(
      this,
    );
  }
}

abstract class _Delay extends ActionModel {
  const factory _Delay({required final int seconds}) = _$DelayImpl;
  const _Delay._() : super._();

  factory _Delay.fromJson(Map<String, dynamic> json) = _$DelayImpl.fromJson;

  int get seconds;
}
