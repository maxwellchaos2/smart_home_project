// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
          EventEntity value, $Res Function(EventEntity) then) =
      _$EventEntityCopyWithImpl<$Res, EventEntity>;
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res, $Val extends EventEntity>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeviceCreatedEventEntityImplCopyWith<$Res> {
  factory _$$DeviceCreatedEventEntityImplCopyWith(
          _$DeviceCreatedEventEntityImpl value,
          $Res Function(_$DeviceCreatedEventEntityImpl) then) =
      __$$DeviceCreatedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, DeviceEntity device, DateTime createdAt});

  $DeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$DeviceCreatedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$DeviceCreatedEventEntityImpl>
    implements _$$DeviceCreatedEventEntityImplCopyWith<$Res> {
  __$$DeviceCreatedEventEntityImplCopyWithImpl(
      _$DeviceCreatedEventEntityImpl _value,
      $Res Function(_$DeviceCreatedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? device = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeviceCreatedEventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res> get device {
    return $DeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeviceCreatedEventEntityImpl extends DeviceCreatedEventEntity {
  const _$DeviceCreatedEventEntityImpl(
      {required this.id, required this.device, required this.createdAt})
      : super._();

  @override
  final int id;
  @override
  final DeviceEntity device;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.deviceCreated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCreatedEventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCreatedEventEntityImplCopyWith<_$DeviceCreatedEventEntityImpl>
      get copyWith => __$$DeviceCreatedEventEntityImplCopyWithImpl<
          _$DeviceCreatedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return deviceCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return deviceCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (deviceCreated != null) {
      return deviceCreated(this);
    }
    return orElse();
  }
}

abstract class DeviceCreatedEventEntity extends EventEntity {
  const factory DeviceCreatedEventEntity(
      {required final int id,
      required final DeviceEntity device,
      required final DateTime createdAt}) = _$DeviceCreatedEventEntityImpl;
  const DeviceCreatedEventEntity._() : super._();

  int get id;
  DeviceEntity get device;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCreatedEventEntityImplCopyWith<_$DeviceCreatedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceUpdatedEventEntityImplCopyWith<$Res> {
  factory _$$DeviceUpdatedEventEntityImplCopyWith(
          _$DeviceUpdatedEventEntityImpl value,
          $Res Function(_$DeviceUpdatedEventEntityImpl) then) =
      __$$DeviceUpdatedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, DeviceEntity device, DateTime createdAt});

  $DeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$DeviceUpdatedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$DeviceUpdatedEventEntityImpl>
    implements _$$DeviceUpdatedEventEntityImplCopyWith<$Res> {
  __$$DeviceUpdatedEventEntityImplCopyWithImpl(
      _$DeviceUpdatedEventEntityImpl _value,
      $Res Function(_$DeviceUpdatedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? device = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeviceUpdatedEventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res> get device {
    return $DeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeviceUpdatedEventEntityImpl extends DeviceUpdatedEventEntity {
  const _$DeviceUpdatedEventEntityImpl(
      {required this.id, required this.device, required this.createdAt})
      : super._();

  @override
  final int id;
  @override
  final DeviceEntity device;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.deviceUpdated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceUpdatedEventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceUpdatedEventEntityImplCopyWith<_$DeviceUpdatedEventEntityImpl>
      get copyWith => __$$DeviceUpdatedEventEntityImplCopyWithImpl<
          _$DeviceUpdatedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return deviceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return deviceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (deviceUpdated != null) {
      return deviceUpdated(this);
    }
    return orElse();
  }
}

abstract class DeviceUpdatedEventEntity extends EventEntity {
  const factory DeviceUpdatedEventEntity(
      {required final int id,
      required final DeviceEntity device,
      required final DateTime createdAt}) = _$DeviceUpdatedEventEntityImpl;
  const DeviceUpdatedEventEntity._() : super._();

  int get id;
  DeviceEntity get device;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceUpdatedEventEntityImplCopyWith<_$DeviceUpdatedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceDeletedEventEntityImplCopyWith<$Res> {
  factory _$$DeviceDeletedEventEntityImplCopyWith(
          _$DeviceDeletedEventEntityImpl value,
          $Res Function(_$DeviceDeletedEventEntityImpl) then) =
      __$$DeviceDeletedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, DeviceEntity device, DateTime createdAt});

  $DeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$DeviceDeletedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$DeviceDeletedEventEntityImpl>
    implements _$$DeviceDeletedEventEntityImplCopyWith<$Res> {
  __$$DeviceDeletedEventEntityImplCopyWithImpl(
      _$DeviceDeletedEventEntityImpl _value,
      $Res Function(_$DeviceDeletedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? device = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeviceDeletedEventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res> get device {
    return $DeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeviceDeletedEventEntityImpl extends DeviceDeletedEventEntity {
  const _$DeviceDeletedEventEntityImpl(
      {required this.id, required this.device, required this.createdAt})
      : super._();

  @override
  final int id;
  @override
  final DeviceEntity device;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.deviceDeleted(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeletedEventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, device, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDeletedEventEntityImplCopyWith<_$DeviceDeletedEventEntityImpl>
      get copyWith => __$$DeviceDeletedEventEntityImplCopyWithImpl<
          _$DeviceDeletedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return deviceDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return deviceDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (deviceDeleted != null) {
      return deviceDeleted(this);
    }
    return orElse();
  }
}

abstract class DeviceDeletedEventEntity extends EventEntity {
  const factory DeviceDeletedEventEntity(
      {required final int id,
      required final DeviceEntity device,
      required final DateTime createdAt}) = _$DeviceDeletedEventEntityImpl;
  const DeviceDeletedEventEntity._() : super._();

  int get id;
  DeviceEntity get device;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceDeletedEventEntityImplCopyWith<_$DeviceDeletedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomCreatedEventEntityImplCopyWith<$Res> {
  factory _$$RoomCreatedEventEntityImplCopyWith(
          _$RoomCreatedEventEntityImpl value,
          $Res Function(_$RoomCreatedEventEntityImpl) then) =
      __$$RoomCreatedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room, DateTime createdAt});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$RoomCreatedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$RoomCreatedEventEntityImpl>
    implements _$$RoomCreatedEventEntityImplCopyWith<$Res> {
  __$$RoomCreatedEventEntityImplCopyWithImpl(
      _$RoomCreatedEventEntityImpl _value,
      $Res Function(_$RoomCreatedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? createdAt = null,
  }) {
    return _then(_$RoomCreatedEventEntityImpl(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get room {
    return $RoomEntityCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$RoomCreatedEventEntityImpl extends RoomCreatedEventEntity {
  const _$RoomCreatedEventEntityImpl(
      {required this.room, required this.createdAt})
      : super._();

  @override
  final RoomEntity room;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.roomCreated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCreatedEventEntityImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCreatedEventEntityImplCopyWith<_$RoomCreatedEventEntityImpl>
      get copyWith => __$$RoomCreatedEventEntityImplCopyWithImpl<
          _$RoomCreatedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return roomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return roomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(this);
    }
    return orElse();
  }
}

abstract class RoomCreatedEventEntity extends EventEntity {
  const factory RoomCreatedEventEntity(
      {required final RoomEntity room,
      required final DateTime createdAt}) = _$RoomCreatedEventEntityImpl;
  const RoomCreatedEventEntity._() : super._();

  RoomEntity get room;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomCreatedEventEntityImplCopyWith<_$RoomCreatedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomUpdatedEventEntityImplCopyWith<$Res> {
  factory _$$RoomUpdatedEventEntityImplCopyWith(
          _$RoomUpdatedEventEntityImpl value,
          $Res Function(_$RoomUpdatedEventEntityImpl) then) =
      __$$RoomUpdatedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room, DateTime createdAt});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$RoomUpdatedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$RoomUpdatedEventEntityImpl>
    implements _$$RoomUpdatedEventEntityImplCopyWith<$Res> {
  __$$RoomUpdatedEventEntityImplCopyWithImpl(
      _$RoomUpdatedEventEntityImpl _value,
      $Res Function(_$RoomUpdatedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? createdAt = null,
  }) {
    return _then(_$RoomUpdatedEventEntityImpl(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get room {
    return $RoomEntityCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$RoomUpdatedEventEntityImpl extends RoomUpdatedEventEntity {
  const _$RoomUpdatedEventEntityImpl(
      {required this.room, required this.createdAt})
      : super._();

  @override
  final RoomEntity room;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.roomUpdated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomUpdatedEventEntityImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomUpdatedEventEntityImplCopyWith<_$RoomUpdatedEventEntityImpl>
      get copyWith => __$$RoomUpdatedEventEntityImplCopyWithImpl<
          _$RoomUpdatedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return roomUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return roomUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (roomUpdated != null) {
      return roomUpdated(this);
    }
    return orElse();
  }
}

abstract class RoomUpdatedEventEntity extends EventEntity {
  const factory RoomUpdatedEventEntity(
      {required final RoomEntity room,
      required final DateTime createdAt}) = _$RoomUpdatedEventEntityImpl;
  const RoomUpdatedEventEntity._() : super._();

  RoomEntity get room;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomUpdatedEventEntityImplCopyWith<_$RoomUpdatedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomDeletedEventEntityImplCopyWith<$Res> {
  factory _$$RoomDeletedEventEntityImplCopyWith(
          _$RoomDeletedEventEntityImpl value,
          $Res Function(_$RoomDeletedEventEntityImpl) then) =
      __$$RoomDeletedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room, DateTime createdAt});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$RoomDeletedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$RoomDeletedEventEntityImpl>
    implements _$$RoomDeletedEventEntityImplCopyWith<$Res> {
  __$$RoomDeletedEventEntityImplCopyWithImpl(
      _$RoomDeletedEventEntityImpl _value,
      $Res Function(_$RoomDeletedEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? createdAt = null,
  }) {
    return _then(_$RoomDeletedEventEntityImpl(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get room {
    return $RoomEntityCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$RoomDeletedEventEntityImpl extends RoomDeletedEventEntity {
  const _$RoomDeletedEventEntityImpl(
      {required this.room, required this.createdAt})
      : super._();

  @override
  final RoomEntity room;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventEntity.roomDeleted(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDeletedEventEntityImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room, createdAt);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDeletedEventEntityImplCopyWith<_$RoomDeletedEventEntityImpl>
      get copyWith => __$$RoomDeletedEventEntityImplCopyWithImpl<
          _$RoomDeletedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return roomDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return roomDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (roomDeleted != null) {
      return roomDeleted(this);
    }
    return orElse();
  }
}

abstract class RoomDeletedEventEntity extends EventEntity {
  const factory RoomDeletedEventEntity(
      {required final RoomEntity room,
      required final DateTime createdAt}) = _$RoomDeletedEventEntityImpl;
  const RoomDeletedEventEntity._() : super._();

  RoomEntity get room;
  DateTime get createdAt;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomDeletedEventEntityImplCopyWith<_$RoomDeletedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewZigbeeDeviceEventEntityImplCopyWith<$Res> {
  factory _$$NewZigbeeDeviceEventEntityImplCopyWith(
          _$NewZigbeeDeviceEventEntityImpl value,
          $Res Function(_$NewZigbeeDeviceEventEntityImpl) then) =
      __$$NewZigbeeDeviceEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ZigbeeDeviceEntity device});

  $ZigbeeDeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$NewZigbeeDeviceEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$NewZigbeeDeviceEventEntityImpl>
    implements _$$NewZigbeeDeviceEventEntityImplCopyWith<$Res> {
  __$$NewZigbeeDeviceEventEntityImplCopyWithImpl(
      _$NewZigbeeDeviceEventEntityImpl _value,
      $Res Function(_$NewZigbeeDeviceEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$NewZigbeeDeviceEventEntityImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as ZigbeeDeviceEntity,
    ));
  }

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ZigbeeDeviceEntityCopyWith<$Res> get device {
    return $ZigbeeDeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$NewZigbeeDeviceEventEntityImpl extends NewZigbeeDeviceEventEntity {
  const _$NewZigbeeDeviceEventEntityImpl({required this.device}) : super._();

  @override
  final ZigbeeDeviceEntity device;

  @override
  String toString() {
    return 'EventEntity.newZigbeeDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewZigbeeDeviceEventEntityImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewZigbeeDeviceEventEntityImplCopyWith<_$NewZigbeeDeviceEventEntityImpl>
      get copyWith => __$$NewZigbeeDeviceEventEntityImplCopyWithImpl<
          _$NewZigbeeDeviceEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NewZigbeeDeviceEventEntity value) newZigbeeDevice,
  }) {
    return newZigbeeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult? Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult? Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult? Function(RoomCreatedEventEntity value)? roomCreated,
    TResult? Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult? Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult? Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
  }) {
    return newZigbeeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCreatedEventEntity value)? deviceCreated,
    TResult Function(DeviceUpdatedEventEntity value)? deviceUpdated,
    TResult Function(DeviceDeletedEventEntity value)? deviceDeleted,
    TResult Function(RoomCreatedEventEntity value)? roomCreated,
    TResult Function(RoomUpdatedEventEntity value)? roomUpdated,
    TResult Function(RoomDeletedEventEntity value)? roomDeleted,
    TResult Function(NewZigbeeDeviceEventEntity value)? newZigbeeDevice,
    required TResult orElse(),
  }) {
    if (newZigbeeDevice != null) {
      return newZigbeeDevice(this);
    }
    return orElse();
  }
}

abstract class NewZigbeeDeviceEventEntity extends EventEntity {
  const factory NewZigbeeDeviceEventEntity(
          {required final ZigbeeDeviceEntity device}) =
      _$NewZigbeeDeviceEventEntityImpl;
  const NewZigbeeDeviceEventEntity._() : super._();

  ZigbeeDeviceEntity get device;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewZigbeeDeviceEventEntityImplCopyWith<_$NewZigbeeDeviceEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
