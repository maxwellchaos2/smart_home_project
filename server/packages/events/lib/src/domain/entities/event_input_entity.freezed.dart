// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventInputEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$DeviceCreatedEventInputEntityImpl
    implements DeviceCreatedEventInputEntity {
  const _$DeviceCreatedEventInputEntityImpl({required this.device});

  @override
  final DeviceEntity device;

  @override
  String toString() {
    return 'EventInputEntity.deviceCreated(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCreatedEventInputEntityImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return deviceCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return deviceCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceCreated != null) {
      return deviceCreated(this);
    }
    return orElse();
  }
}

abstract class DeviceCreatedEventInputEntity implements EventInputEntity {
  const factory DeviceCreatedEventInputEntity(
          {required final DeviceEntity device}) =
      _$DeviceCreatedEventInputEntityImpl;

  DeviceEntity get device;
}

/// @nodoc

class _$DeviceUpdatedEventInputEntityImpl
    implements DeviceUpdatedEventInputEntity {
  const _$DeviceUpdatedEventInputEntityImpl({required this.device});

  @override
  final DeviceEntity device;

  @override
  String toString() {
    return 'EventInputEntity.deviceUpdated(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceUpdatedEventInputEntityImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return deviceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return deviceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceUpdated != null) {
      return deviceUpdated(this);
    }
    return orElse();
  }
}

abstract class DeviceUpdatedEventInputEntity implements EventInputEntity {
  const factory DeviceUpdatedEventInputEntity(
          {required final DeviceEntity device}) =
      _$DeviceUpdatedEventInputEntityImpl;

  DeviceEntity get device;
}

/// @nodoc

class _$DeviceDeletedEventInputEntityImpl
    implements DeviceDeletedEventInputEntity {
  const _$DeviceDeletedEventInputEntityImpl({required this.device});

  @override
  final DeviceEntity device;

  @override
  String toString() {
    return 'EventInputEntity.deviceDeleted(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeletedEventInputEntityImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return deviceDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return deviceDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceDeleted != null) {
      return deviceDeleted(this);
    }
    return orElse();
  }
}

abstract class DeviceDeletedEventInputEntity implements EventInputEntity {
  const factory DeviceDeletedEventInputEntity(
          {required final DeviceEntity device}) =
      _$DeviceDeletedEventInputEntityImpl;

  DeviceEntity get device;
}

/// @nodoc

class _$RoomCreatedEventInputEntityImpl implements RoomCreatedEventInputEntity {
  const _$RoomCreatedEventInputEntityImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'EventInputEntity.roomCreated(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCreatedEventInputEntityImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return roomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return roomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(this);
    }
    return orElse();
  }
}

abstract class RoomCreatedEventInputEntity implements EventInputEntity {
  const factory RoomCreatedEventInputEntity({required final RoomEntity room}) =
      _$RoomCreatedEventInputEntityImpl;

  RoomEntity get room;
}

/// @nodoc

class _$RoomUpdatedEventInputEntityImpl implements RoomUpdatedEventInputEntity {
  const _$RoomUpdatedEventInputEntityImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'EventInputEntity.roomUpdated(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomUpdatedEventInputEntityImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return roomUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return roomUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomUpdated != null) {
      return roomUpdated(this);
    }
    return orElse();
  }
}

abstract class RoomUpdatedEventInputEntity implements EventInputEntity {
  const factory RoomUpdatedEventInputEntity({required final RoomEntity room}) =
      _$RoomUpdatedEventInputEntityImpl;

  RoomEntity get room;
}

/// @nodoc

class _$RoomDeletedEventInputEntityImpl implements RoomDeletedEventInputEntity {
  const _$RoomDeletedEventInputEntityImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'EventInputEntity.roomDeleted(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDeletedEventInputEntityImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventInputEntity value)
        deviceCreated,
    required TResult Function(DeviceUpdatedEventInputEntity value)
        deviceUpdated,
    required TResult Function(DeviceDeletedEventInputEntity value)
        deviceDeleted,
    required TResult Function(RoomCreatedEventInputEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventInputEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventInputEntity value) roomDeleted,
  }) {
    return roomDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventInputEntity value)? roomDeleted,
  }) {
    return roomDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventInputEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventInputEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventInputEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventInputEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventInputEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventInputEntity value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomDeleted != null) {
      return roomDeleted(this);
    }
    return orElse();
  }
}

abstract class RoomDeletedEventInputEntity implements EventInputEntity {
  const factory RoomDeletedEventInputEntity({required final RoomEntity room}) =
      _$RoomDeletedEventInputEntityImpl;

  RoomEntity get room;
}
