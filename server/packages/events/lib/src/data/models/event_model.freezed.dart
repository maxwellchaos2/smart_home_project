// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'deviceCreated':
      return _DeviceCreated.fromJson(json);
    case 'deviceUpdated':
      return _DeviceUpdated.fromJson(json);
    case 'deviceDeleted':
      return _DeviceDeleted.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'EventModel', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$EventModel {
  int get id => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  DeviceModel get device => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceCreatedImpl extends _DeviceCreated {
  const _$DeviceCreatedImpl(
      {required this.id,
      required this.deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required this.device,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceCreated',
        super._();

  factory _$DeviceCreatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceCreatedImplFromJson(json);

  @override
  final int id;
  @override
  final int deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  final DeviceModel device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceCreated(id: $id, deviceId: $deviceId, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCreatedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
  }) {
    return deviceCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
  }) {
    return deviceCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    required TResult orElse(),
  }) {
    if (deviceCreated != null) {
      return deviceCreated(this);
    }
    return orElse();
  }
}

abstract class _DeviceCreated extends EventModel {
  const factory _DeviceCreated(
      {required final int id,
      required final int deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required final DeviceModel device,
      @JsonKey(fromJson: dateTimeFromJson)
      required final DateTime createdAt}) = _$DeviceCreatedImpl;
  const _DeviceCreated._() : super._();

  factory _DeviceCreated.fromJson(Map<String, dynamic> json) =
      _$DeviceCreatedImpl.fromJson;

  @override
  int get id;
  @override
  int get deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  DeviceModel get device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceUpdatedImpl extends _DeviceUpdated {
  const _$DeviceUpdatedImpl(
      {required this.id,
      required this.deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required this.device,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceUpdated',
        super._();

  factory _$DeviceUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceUpdatedImplFromJson(json);

  @override
  final int id;
  @override
  final int deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  final DeviceModel device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceUpdated(id: $id, deviceId: $deviceId, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceUpdatedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
  }) {
    return deviceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
  }) {
    return deviceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    required TResult orElse(),
  }) {
    if (deviceUpdated != null) {
      return deviceUpdated(this);
    }
    return orElse();
  }
}

abstract class _DeviceUpdated extends EventModel {
  const factory _DeviceUpdated(
      {required final int id,
      required final int deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required final DeviceModel device,
      @JsonKey(fromJson: dateTimeFromJson)
      required final DateTime createdAt}) = _$DeviceUpdatedImpl;
  const _DeviceUpdated._() : super._();

  factory _DeviceUpdated.fromJson(Map<String, dynamic> json) =
      _$DeviceUpdatedImpl.fromJson;

  @override
  int get id;
  @override
  int get deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  DeviceModel get device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceDeletedImpl extends _DeviceDeleted {
  const _$DeviceDeletedImpl(
      {required this.id,
      required this.deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required this.device,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceDeleted',
        super._();

  factory _$DeviceDeletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceDeletedImplFromJson(json);

  @override
  final int id;
  @override
  final int deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  final DeviceModel device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceDeleted(id: $id, deviceId: $deviceId, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeletedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
  }) {
    return deviceDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
  }) {
    return deviceDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    required TResult orElse(),
  }) {
    if (deviceDeleted != null) {
      return deviceDeleted(this);
    }
    return orElse();
  }
}

abstract class _DeviceDeleted extends EventModel {
  const factory _DeviceDeleted(
      {required final int id,
      required final int deviceId,
      @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
      required final DeviceModel device,
      @JsonKey(fromJson: dateTimeFromJson)
      required final DateTime createdAt}) = _$DeviceDeletedImpl;
  const _DeviceDeleted._() : super._();

  factory _DeviceDeleted.fromJson(Map<String, dynamic> json) =
      _$DeviceDeletedImpl.fromJson;

  @override
  int get id;
  @override
  int get deviceId;
  @override
  @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
  DeviceModel get device;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
}
