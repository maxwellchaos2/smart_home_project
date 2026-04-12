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
    case 'newZigbeeDevice':
      return _EventNewZigbeeDeviceModel.fromJson(json);

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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
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
class _$EventNewZigbeeDeviceModelImpl extends _EventNewZigbeeDeviceModel {
  const _$EventNewZigbeeDeviceModelImpl(
      {required this.device, final String? $type})
      : $type = $type ?? 'newZigbeeDevice',
        super._();

  factory _$EventNewZigbeeDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventNewZigbeeDeviceModelImplFromJson(json);

  @override
  final ZigbeeDeviceModel device;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventModel.newZigbeeDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNewZigbeeDeviceModelImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventNeedDeviceCreatedModel value) deviceCreated,
    required TResult Function(_EventNeedDeviceUpdatedModel value) deviceUpdated,
    required TResult Function(_EventNeedDeviceDeletedModel value) deviceDeleted,
    required TResult Function(_EventRoomCreatedModel value) roomCreated,
    required TResult Function(_EventRoomUpdatedModel value) roomUpdated,
    required TResult Function(_EventRoomDeletedModel value) roomDeleted,
    required TResult Function(_EventNewZigbeeDeviceModel value) newZigbeeDevice,
  }) {
    return newZigbeeDevice(this);
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
    TResult? Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
  }) {
    return newZigbeeDevice?.call(this);
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
    TResult Function(_EventNewZigbeeDeviceModel value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (newZigbeeDevice != null) {
      return newZigbeeDevice(this);
    }
    return orElse();
  }
}

abstract class _EventNewZigbeeDeviceModel extends EventModel {
  const factory _EventNewZigbeeDeviceModel(
          {required final ZigbeeDeviceModel device}) =
      _$EventNewZigbeeDeviceModelImpl;
  const _EventNewZigbeeDeviceModel._() : super._();

  factory _EventNewZigbeeDeviceModel.fromJson(Map<String, dynamic> json) =
      _$EventNewZigbeeDeviceModelImpl.fromJson;

  ZigbeeDeviceModel get device;
}
