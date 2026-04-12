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
      return _ActionChangeOutputModel.fromJson(json);
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
    required TResult Function(_ActionChangeOutputModel value) changeDevice,
    required TResult Function(_ActionDelayModel value) delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputModel value)? changeDevice,
    TResult? Function(_ActionDelayModel value)? delay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputModel value)? changeDevice,
    TResult Function(_ActionDelayModel value)? delay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ActionChangeOutputModelImpl extends _ActionChangeOutputModel {
  const _$ActionChangeOutputModelImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'changeDevice',
        super._();

  factory _$ActionChangeOutputModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionChangeOutputModelImplFromJson(json);

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
            other is _$ActionChangeOutputModelImpl &&
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
    required TResult Function(_ActionChangeOutputModel value) changeDevice,
    required TResult Function(_ActionDelayModel value) delay,
  }) {
    return changeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputModel value)? changeDevice,
    TResult? Function(_ActionDelayModel value)? delay,
  }) {
    return changeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputModel value)? changeDevice,
    TResult Function(_ActionDelayModel value)? delay,
    required TResult orElse(),
  }) {
    if (changeDevice != null) {
      return changeDevice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionChangeOutputModelImplToJson(
      this,
    );
  }
}

abstract class _ActionChangeOutputModel extends ActionModel {
  const factory _ActionChangeOutputModel(
      {required final String deviceId,
      required final bool? state}) = _$ActionChangeOutputModelImpl;
  const _ActionChangeOutputModel._() : super._();

  factory _ActionChangeOutputModel.fromJson(Map<String, dynamic> json) =
      _$ActionChangeOutputModelImpl.fromJson;

  String get deviceId;
  bool? get state;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
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
    required TResult Function(_ActionChangeOutputModel value) changeDevice,
    required TResult Function(_ActionDelayModel value) delay,
  }) {
    return delay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActionChangeOutputModel value)? changeDevice,
    TResult? Function(_ActionDelayModel value)? delay,
  }) {
    return delay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActionChangeOutputModel value)? changeDevice,
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
