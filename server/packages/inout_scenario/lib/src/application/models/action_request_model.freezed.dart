// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionRequestModel _$ActionRequestModelFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'changeDevice':
      return _ActionChangeOutputRequestModel.fromJson(json);
    case 'delay':
      return _ActionDelayRequestModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ActionRequestModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ActionRequestModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeOutputRequestModel value)
        changeDevice,
    required TResult Function(_ActionDelayRequestModel value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult? Function(_ActionDelayRequestModel value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult Function(_ActionDelayRequestModel value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActionChangeOutputRequestModelImpl
    extends _ActionChangeOutputRequestModel {
  const _$ActionChangeOutputRequestModelImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'changeDevice',
        super._();

  factory _$ActionChangeOutputRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActionChangeOutputRequestModelImplFromJson(json);

  @override
  final String deviceId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ActionRequestModel.changeDevice(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionChangeOutputRequestModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeOutputRequestModel value)
        changeDevice,
    required TResult Function(_ActionDelayRequestModel value) delay,
  }) {
    return changeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult? Function(_ActionDelayRequestModel value)? delay,
  }) {
    return changeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult Function(_ActionDelayRequestModel value)? delay,
    required TResult orElse(),
  }) {
    if (changeDevice != null) {
      return changeDevice(this);
    }
    return orElse();
  }
}

abstract class _ActionChangeOutputRequestModel extends ActionRequestModel {
  const factory _ActionChangeOutputRequestModel(
      {required final String deviceId,
      required final bool? state}) = _$ActionChangeOutputRequestModelImpl;
  const _ActionChangeOutputRequestModel._() : super._();

  factory _ActionChangeOutputRequestModel.fromJson(Map<String, dynamic> json) =
      _$ActionChangeOutputRequestModelImpl.fromJson;

  String get deviceId;
  bool? get state;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActionDelayRequestModelImpl extends _ActionDelayRequestModel {
  const _$ActionDelayRequestModelImpl(
      {required this.seconds, final String? $type})
      : $type = $type ?? 'delay',
        super._();

  factory _$ActionDelayRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionDelayRequestModelImplFromJson(json);

  @override
  final int seconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ActionRequestModel.delay(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionDelayRequestModelImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeOutputRequestModel value)
        changeDevice,
    required TResult Function(_ActionDelayRequestModel value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult? Function(_ActionDelayRequestModel value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputRequestModel value)? changeDevice,
    TResult Function(_ActionDelayRequestModel value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }
}

abstract class _ActionDelayRequestModel extends ActionRequestModel {
  const factory _ActionDelayRequestModel({required final int seconds}) =
      _$ActionDelayRequestModelImpl;
  const _ActionDelayRequestModel._() : super._();

  factory _ActionDelayRequestModel.fromJson(Map<String, dynamic> json) =
      _$ActionDelayRequestModelImpl.fromJson;

  int get seconds;
}
