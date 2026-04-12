// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionResponseModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeDeviceStateResponseModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayResponseModel value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult? Function(_ActionDelayResponseModel value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult Function(_ActionDelayResponseModel value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ActionResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ActionChangeDeviceStateResponseModelImpl
    extends _ActionChangeDeviceStateResponseModel {
  const _$ActionChangeDeviceStateResponseModelImpl(
      {required this.deviceId,
      required final Map<String, dynamic> state,
      final String? $type})
      : _state = state,
        $type = $type ?? 'change_device_state',
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
    return 'ActionResponseModel.changeDeviceState(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionChangeDeviceStateResponseModelImpl &&
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
    required TResult Function(_ActionChangeDeviceStateResponseModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayResponseModel value) delay,
  }) {
    return changeDeviceState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult? Function(_ActionDelayResponseModel value)? delay,
  }) {
    return changeDeviceState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult Function(_ActionDelayResponseModel value)? delay,
    required TResult orElse(),
  }) {
    if (changeDeviceState != null) {
      return changeDeviceState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionChangeDeviceStateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ActionChangeDeviceStateResponseModel
    extends ActionResponseModel {
  const factory _ActionChangeDeviceStateResponseModel(
          {required final int deviceId,
          required final Map<String, dynamic> state}) =
      _$ActionChangeDeviceStateResponseModelImpl;
  const _ActionChangeDeviceStateResponseModel._() : super._();

  int get deviceId;
  Map<String, dynamic> get state;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ActionDelayResponseModelImpl extends _ActionDelayResponseModel {
  const _$ActionDelayResponseModelImpl(
      {required this.seconds, final String? $type})
      : $type = $type ?? 'delay',
        super._();

  @override
  final int seconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ActionResponseModel.delay(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionDelayResponseModelImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActionChangeDeviceStateResponseModel value)
        changeDeviceState,
    required TResult Function(_ActionDelayResponseModel value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult? Function(_ActionDelayResponseModel value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeDeviceStateResponseModel value)?
        changeDeviceState,
    TResult Function(_ActionDelayResponseModel value)? delay,
    required TResult orElse(),
  }) {
    if (delay != null) {
      return delay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionDelayResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ActionDelayResponseModel extends ActionResponseModel {
  const factory _ActionDelayResponseModel({required final int seconds}) =
      _$ActionDelayResponseModelImpl;
  const _ActionDelayResponseModel._() : super._();

  int get seconds;
}
