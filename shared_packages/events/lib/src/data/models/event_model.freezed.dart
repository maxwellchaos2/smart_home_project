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
      return _EventNeedDeviceCreatedModel.fromJson(json);
    case 'deviceUpdated':
      return _EventNeedDeviceUpdatedModel.fromJson(json);
    case 'deviceDeleted':
      return _EventNeedDeviceDeletedModel.fromJson(json);
    case 'roomCreated':
      return _EventRoomCreatedModel.fromJson(json);
    case 'roomUpdated':
      return _EventRoomUpdatedModel.fromJson(json);
    case 'roomDeleted':
      return _EventRoomDeletedModel.fromJson(json);
    case 'needDeviceCapabilitiesChange':
      return _EventNeedDeviceCapabilitiesChangeModel.fromJson(json);
    case 'deviceStateChanged':
      return _EventDeviceStateChangedModel.fromJson(json);
    case 'needRunDeviceScenario':
      return _EventNeedRunDeviceScenarioModel.fromJson(json);
    case 'permitJoinZigbeeDevices':
      return _EventPermitJoinZigbeeDevicesModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'EventModel', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$EventModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventNeedDeviceCreatedModelImpl extends _EventNeedDeviceCreatedModel {
  const _$EventNeedDeviceCreatedModelImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceCreated',
        super._();

  factory _$EventNeedDeviceCreatedModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventNeedDeviceCreatedModelImplFromJson(json);

  @override
  final int id;
  @override
  final DeviceResponseModel device;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceCreated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNeedDeviceCreatedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return deviceCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return deviceCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (deviceCreated != null) {
      return deviceCreated(this);
    }
    return orElse();
  }
}

abstract class _EventNeedDeviceCreatedModel extends EventModel {
  const factory _EventNeedDeviceCreatedModel(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$EventNeedDeviceCreatedModelImpl;
  const _EventNeedDeviceCreatedModel._() : super._();

  factory _EventNeedDeviceCreatedModel.fromJson(Map<String, dynamic> json) =
      _$EventNeedDeviceCreatedModelImpl.fromJson;

  int get id;
  DeviceResponseModel get device;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventNeedDeviceUpdatedModelImpl extends _EventNeedDeviceUpdatedModel {
  const _$EventNeedDeviceUpdatedModelImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceUpdated',
        super._();

  factory _$EventNeedDeviceUpdatedModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventNeedDeviceUpdatedModelImplFromJson(json);

  @override
  final int id;
  @override
  final DeviceResponseModel device;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceUpdated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNeedDeviceUpdatedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return deviceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return deviceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (deviceUpdated != null) {
      return deviceUpdated(this);
    }
    return orElse();
  }
}

abstract class _EventNeedDeviceUpdatedModel extends EventModel {
  const factory _EventNeedDeviceUpdatedModel(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$EventNeedDeviceUpdatedModelImpl;
  const _EventNeedDeviceUpdatedModel._() : super._();

  factory _EventNeedDeviceUpdatedModel.fromJson(Map<String, dynamic> json) =
      _$EventNeedDeviceUpdatedModelImpl.fromJson;

  int get id;
  DeviceResponseModel get device;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventNeedDeviceDeletedModelImpl extends _EventNeedDeviceDeletedModel {
  const _$EventNeedDeviceDeletedModelImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceDeleted',
        super._();

  factory _$EventNeedDeviceDeletedModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventNeedDeviceDeletedModelImplFromJson(json);

  @override
  final int id;
  @override
  final DeviceResponseModel device;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceDeleted(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNeedDeviceDeletedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return deviceDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return deviceDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (deviceDeleted != null) {
      return deviceDeleted(this);
    }
    return orElse();
  }
}

abstract class _EventNeedDeviceDeletedModel extends EventModel {
  const factory _EventNeedDeviceDeletedModel(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$EventNeedDeviceDeletedModelImpl;
  const _EventNeedDeviceDeletedModel._() : super._();

  factory _EventNeedDeviceDeletedModel.fromJson(Map<String, dynamic> json) =
      _$EventNeedDeviceDeletedModelImpl.fromJson;

  int get id;
  DeviceResponseModel get device;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventRoomCreatedModelImpl extends _EventRoomCreatedModel {
  const _$EventRoomCreatedModelImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomCreated',
        super._();

  factory _$EventRoomCreatedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRoomCreatedModelImplFromJson(json);

  @override
  final RoomModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.roomCreated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRoomCreatedModelImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return roomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return roomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(this);
    }
    return orElse();
  }
}

abstract class _EventRoomCreatedModel extends EventModel {
  const factory _EventRoomCreatedModel(
      {required final RoomModel room,
      required final DateTime createdAt}) = _$EventRoomCreatedModelImpl;
  const _EventRoomCreatedModel._() : super._();

  factory _EventRoomCreatedModel.fromJson(Map<String, dynamic> json) =
      _$EventRoomCreatedModelImpl.fromJson;

  RoomModel get room;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventRoomUpdatedModelImpl extends _EventRoomUpdatedModel {
  const _$EventRoomUpdatedModelImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomUpdated',
        super._();

  factory _$EventRoomUpdatedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRoomUpdatedModelImplFromJson(json);

  @override
  final RoomModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.roomUpdated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRoomUpdatedModelImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return roomUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return roomUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (roomUpdated != null) {
      return roomUpdated(this);
    }
    return orElse();
  }
}

abstract class _EventRoomUpdatedModel extends EventModel {
  const factory _EventRoomUpdatedModel(
      {required final RoomModel room,
      required final DateTime createdAt}) = _$EventRoomUpdatedModelImpl;
  const _EventRoomUpdatedModel._() : super._();

  factory _EventRoomUpdatedModel.fromJson(Map<String, dynamic> json) =
      _$EventRoomUpdatedModelImpl.fromJson;

  RoomModel get room;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventRoomDeletedModelImpl extends _EventRoomDeletedModel {
  const _$EventRoomDeletedModelImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomDeleted',
        super._();

  factory _$EventRoomDeletedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRoomDeletedModelImplFromJson(json);

  @override
  final RoomModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.roomDeleted(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRoomDeletedModelImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return roomDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return roomDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (roomDeleted != null) {
      return roomDeleted(this);
    }
    return orElse();
  }
}

abstract class _EventRoomDeletedModel extends EventModel {
  const factory _EventRoomDeletedModel(
      {required final RoomModel room,
      required final DateTime createdAt}) = _$EventRoomDeletedModelImpl;
  const _EventRoomDeletedModel._() : super._();

  factory _EventRoomDeletedModel.fromJson(Map<String, dynamic> json) =
      _$EventRoomDeletedModelImpl.fromJson;

  RoomModel get room;
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventNeedDeviceCapabilitiesChangeModelImpl
    extends _EventNeedDeviceCapabilitiesChangeModel {
  const _$EventNeedDeviceCapabilitiesChangeModelImpl(
      {required this.deviceId,
      required final List<DeviceCapabilityEntity> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'needDeviceCapabilitiesChange',
        super._();

  factory _$EventNeedDeviceCapabilitiesChangeModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventNeedDeviceCapabilitiesChangeModelImplFromJson(json);

  @override
  final int deviceId;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.needDeviceCapabilitiesChange(deviceId: $deviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNeedDeviceCapabilitiesChangeModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId,
      const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (needDeviceCapabilitiesChange != null) {
      return needDeviceCapabilitiesChange(this);
    }
    return orElse();
  }
}

abstract class _EventNeedDeviceCapabilitiesChangeModel extends EventModel {
  const factory _EventNeedDeviceCapabilitiesChangeModel(
          {required final int deviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$EventNeedDeviceCapabilitiesChangeModelImpl;
  const _EventNeedDeviceCapabilitiesChangeModel._() : super._();

  factory _EventNeedDeviceCapabilitiesChangeModel.fromJson(
          Map<String, dynamic> json) =
      _$EventNeedDeviceCapabilitiesChangeModelImpl.fromJson;

  int get deviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventDeviceStateChangedModelImpl extends _EventDeviceStateChangedModel {
  const _$EventDeviceStateChangedModelImpl(
      {required this.deviceId,
      required final List<DeviceCapabilityEntity>? deviceCapabilities,
      required final List<DevicePropertyEntity>? deviceProperties,
      final String? $type})
      : _deviceCapabilities = deviceCapabilities,
        _deviceProperties = deviceProperties,
        $type = $type ?? 'deviceStateChanged',
        super._();

  factory _$EventDeviceStateChangedModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventDeviceStateChangedModelImplFromJson(json);

  @override
  final int deviceId;
  final List<DeviceCapabilityEntity>? _deviceCapabilities;
  @override
  List<DeviceCapabilityEntity>? get deviceCapabilities {
    final value = _deviceCapabilities;
    if (value == null) return null;
    if (_deviceCapabilities is EqualUnmodifiableListView)
      return _deviceCapabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DevicePropertyEntity>? _deviceProperties;
  @override
  List<DevicePropertyEntity>? get deviceProperties {
    final value = _deviceProperties;
    if (value == null) return null;
    if (_deviceProperties is EqualUnmodifiableListView)
      return _deviceProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.deviceStateChanged(deviceId: $deviceId, deviceCapabilities: $deviceCapabilities, deviceProperties: $deviceProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDeviceStateChangedModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._deviceCapabilities, _deviceCapabilities) &&
            const DeepCollectionEquality()
                .equals(other._deviceProperties, _deviceProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      const DeepCollectionEquality().hash(_deviceCapabilities),
      const DeepCollectionEquality().hash(_deviceProperties));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return deviceStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return deviceStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (deviceStateChanged != null) {
      return deviceStateChanged(this);
    }
    return orElse();
  }
}

abstract class _EventDeviceStateChangedModel extends EventModel {
  const factory _EventDeviceStateChangedModel(
          {required final int deviceId,
          required final List<DeviceCapabilityEntity>? deviceCapabilities,
          required final List<DevicePropertyEntity>? deviceProperties}) =
      _$EventDeviceStateChangedModelImpl;
  const _EventDeviceStateChangedModel._() : super._();

  factory _EventDeviceStateChangedModel.fromJson(Map<String, dynamic> json) =
      _$EventDeviceStateChangedModelImpl.fromJson;

  int get deviceId;
  List<DeviceCapabilityEntity>? get deviceCapabilities;
  List<DevicePropertyEntity>? get deviceProperties;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventNeedRunDeviceScenarioModelImpl
    extends _EventNeedRunDeviceScenarioModel {
  const _$EventNeedRunDeviceScenarioModelImpl(
      {required this.scenarioId, final String? $type})
      : $type = $type ?? 'needRunDeviceScenario',
        super._();

  factory _$EventNeedRunDeviceScenarioModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventNeedRunDeviceScenarioModelImplFromJson(json);

  @override
  final int scenarioId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.needRunDeviceScenario(scenarioId: $scenarioId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNeedRunDeviceScenarioModelImpl &&
            (identical(other.scenarioId, scenarioId) ||
                other.scenarioId == scenarioId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scenarioId);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return needRunDeviceScenario(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return needRunDeviceScenario?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (needRunDeviceScenario != null) {
      return needRunDeviceScenario(this);
    }
    return orElse();
  }
}

abstract class _EventNeedRunDeviceScenarioModel extends EventModel {
  const factory _EventNeedRunDeviceScenarioModel(
      {required final int scenarioId}) = _$EventNeedRunDeviceScenarioModelImpl;
  const _EventNeedRunDeviceScenarioModel._() : super._();

  factory _EventNeedRunDeviceScenarioModel.fromJson(Map<String, dynamic> json) =
      _$EventNeedRunDeviceScenarioModelImpl.fromJson;

  int get scenarioId;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventPermitJoinZigbeeDevicesModelImpl
    extends _EventPermitJoinZigbeeDevicesModel {
  const _$EventPermitJoinZigbeeDevicesModelImpl(
      {required this.value, required this.time, final String? $type})
      : $type = $type ?? 'permitJoinZigbeeDevices',
        super._();

  factory _$EventPermitJoinZigbeeDevicesModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EventPermitJoinZigbeeDevicesModelImplFromJson(json);

  @override
  final bool value;
  @override
  final int time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.permitJoinZigbeeDevices(value: $value, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventPermitJoinZigbeeDevicesModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, time);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventDeviceStateChangedModel value)
        deviceStateChanged,
    required TResult Function(_EventNeedRunDeviceScenarioModel value)
        needRunDeviceScenario,
    required TResult Function(_EventPermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult? Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult? Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult? Function(_EventRoomCreatedModel value)? roomCreated,
    TResult? Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult? Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult? Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult? Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult? Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventNeedDeviceCreatedModel value)? deviceCreated,
    TResult Function(_EventNeedDeviceUpdatedModel value)? deviceUpdated,
    TResult Function(_EventNeedDeviceDeletedModel value)? deviceDeleted,
    TResult Function(_EventRoomCreatedModel value)? roomCreated,
    TResult Function(_EventRoomUpdatedModel value)? roomUpdated,
    TResult Function(_EventRoomDeletedModel value)? roomDeleted,
    TResult Function(_EventNeedDeviceCapabilitiesChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventDeviceStateChangedModel value)? deviceStateChanged,
    TResult Function(_EventNeedRunDeviceScenarioModel value)?
        needRunDeviceScenario,
    TResult Function(_EventPermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (permitJoinZigbeeDevices != null) {
      return permitJoinZigbeeDevices(this);
    }
    return orElse();
  }
}

abstract class _EventPermitJoinZigbeeDevicesModel extends EventModel {
  const factory _EventPermitJoinZigbeeDevicesModel(
      {required final bool value,
      required final int time}) = _$EventPermitJoinZigbeeDevicesModelImpl;
  const _EventPermitJoinZigbeeDevicesModel._() : super._();

  factory _EventPermitJoinZigbeeDevicesModel.fromJson(
          Map<String, dynamic> json) =
      _$EventPermitJoinZigbeeDevicesModelImpl.fromJson;

  bool get value;
  int get time;
}
