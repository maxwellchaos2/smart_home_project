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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
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
  @JsonKey(ignore: true)
  _$$RoomDeletedEventEntityImplCopyWith<_$RoomDeletedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWith<$Res> {
  factory _$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWith(
          _$NeedDeviceCapabilitiesChangeEventEntityImpl value,
          $Res Function(_$NeedDeviceCapabilitiesChangeEventEntityImpl) then) =
      __$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int deviceId, List<DeviceCapabilityEntity> capabilities});
}

/// @nodoc
class __$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res,
        _$NeedDeviceCapabilitiesChangeEventEntityImpl>
    implements _$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWith<$Res> {
  __$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWithImpl(
      _$NeedDeviceCapabilitiesChangeEventEntityImpl _value,
      $Res Function(_$NeedDeviceCapabilitiesChangeEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? capabilities = null,
  }) {
    return _then(_$NeedDeviceCapabilitiesChangeEventEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
    ));
  }
}

/// @nodoc

class _$NeedDeviceCapabilitiesChangeEventEntityImpl
    extends NeedDeviceCapabilitiesChangeEventEntity {
  const _$NeedDeviceCapabilitiesChangeEventEntityImpl(
      {required this.deviceId,
      required final List<DeviceCapabilityEntity> capabilities})
      : _capabilities = capabilities,
        super._();

  @override
  final int deviceId;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @override
  String toString() {
    return 'EventEntity.needDeviceCapabilitiesChange(deviceId: $deviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeedDeviceCapabilitiesChangeEventEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId,
      const DeepCollectionEquality().hash(_capabilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWith<
          _$NeedDeviceCapabilitiesChangeEventEntityImpl>
      get copyWith =>
          __$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWithImpl<
              _$NeedDeviceCapabilitiesChangeEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange(this);
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (needDeviceCapabilitiesChange != null) {
      return needDeviceCapabilitiesChange(this);
    }
    return orElse();
  }
}

abstract class NeedDeviceCapabilitiesChangeEventEntity extends EventEntity {
  const factory NeedDeviceCapabilitiesChangeEventEntity(
          {required final int deviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$NeedDeviceCapabilitiesChangeEventEntityImpl;
  const NeedDeviceCapabilitiesChangeEventEntity._() : super._();

  int get deviceId;
  List<DeviceCapabilityEntity> get capabilities;
  @JsonKey(ignore: true)
  _$$NeedDeviceCapabilitiesChangeEventEntityImplCopyWith<
          _$NeedDeviceCapabilitiesChangeEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceStateChangedEventEntityImplCopyWith<$Res> {
  factory _$$DeviceStateChangedEventEntityImplCopyWith(
          _$DeviceStateChangedEventEntityImpl value,
          $Res Function(_$DeviceStateChangedEventEntityImpl) then) =
      __$$DeviceStateChangedEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int deviceId,
      List<DeviceCapabilityEntity>? deviceCapabilities,
      List<DevicePropertyEntity>? deviceProperties});
}

/// @nodoc
class __$$DeviceStateChangedEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$DeviceStateChangedEventEntityImpl>
    implements _$$DeviceStateChangedEventEntityImplCopyWith<$Res> {
  __$$DeviceStateChangedEventEntityImplCopyWithImpl(
      _$DeviceStateChangedEventEntityImpl _value,
      $Res Function(_$DeviceStateChangedEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceCapabilities = freezed,
    Object? deviceProperties = freezed,
  }) {
    return _then(_$DeviceStateChangedEventEntityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceCapabilities: freezed == deviceCapabilities
          ? _value._deviceCapabilities
          : deviceCapabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>?,
      deviceProperties: freezed == deviceProperties
          ? _value._deviceProperties
          : deviceProperties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>?,
    ));
  }
}

/// @nodoc

class _$DeviceStateChangedEventEntityImpl
    extends DeviceStateChangedEventEntity {
  const _$DeviceStateChangedEventEntityImpl(
      {required this.deviceId,
      required final List<DeviceCapabilityEntity>? deviceCapabilities,
      required final List<DevicePropertyEntity>? deviceProperties})
      : _deviceCapabilities = deviceCapabilities,
        _deviceProperties = deviceProperties,
        super._();

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

  @override
  String toString() {
    return 'EventEntity.deviceStateChanged(deviceId: $deviceId, deviceCapabilities: $deviceCapabilities, deviceProperties: $deviceProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateChangedEventEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._deviceCapabilities, _deviceCapabilities) &&
            const DeepCollectionEquality()
                .equals(other._deviceProperties, _deviceProperties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      const DeepCollectionEquality().hash(_deviceCapabilities),
      const DeepCollectionEquality().hash(_deviceProperties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateChangedEventEntityImplCopyWith<
          _$DeviceStateChangedEventEntityImpl>
      get copyWith => __$$DeviceStateChangedEventEntityImplCopyWithImpl<
          _$DeviceStateChangedEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
  }) {
    return deviceStateChanged(this);
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return deviceStateChanged?.call(this);
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (deviceStateChanged != null) {
      return deviceStateChanged(this);
    }
    return orElse();
  }
}

abstract class DeviceStateChangedEventEntity extends EventEntity {
  const factory DeviceStateChangedEventEntity(
          {required final int deviceId,
          required final List<DeviceCapabilityEntity>? deviceCapabilities,
          required final List<DevicePropertyEntity>? deviceProperties}) =
      _$DeviceStateChangedEventEntityImpl;
  const DeviceStateChangedEventEntity._() : super._();

  int get deviceId;
  List<DeviceCapabilityEntity>? get deviceCapabilities;
  List<DevicePropertyEntity>? get deviceProperties;
  @JsonKey(ignore: true)
  _$$DeviceStateChangedEventEntityImplCopyWith<
          _$DeviceStateChangedEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NeedRunDeviceScenarioEventEntityImplCopyWith<$Res> {
  factory _$$NeedRunDeviceScenarioEventEntityImplCopyWith(
          _$NeedRunDeviceScenarioEventEntityImpl value,
          $Res Function(_$NeedRunDeviceScenarioEventEntityImpl) then) =
      __$$NeedRunDeviceScenarioEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int scenarioId});
}

/// @nodoc
class __$$NeedRunDeviceScenarioEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res,
        _$NeedRunDeviceScenarioEventEntityImpl>
    implements _$$NeedRunDeviceScenarioEventEntityImplCopyWith<$Res> {
  __$$NeedRunDeviceScenarioEventEntityImplCopyWithImpl(
      _$NeedRunDeviceScenarioEventEntityImpl _value,
      $Res Function(_$NeedRunDeviceScenarioEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarioId = null,
  }) {
    return _then(_$NeedRunDeviceScenarioEventEntityImpl(
      scenarioId: null == scenarioId
          ? _value.scenarioId
          : scenarioId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NeedRunDeviceScenarioEventEntityImpl
    extends NeedRunDeviceScenarioEventEntity {
  const _$NeedRunDeviceScenarioEventEntityImpl({required this.scenarioId})
      : super._();

  @override
  final int scenarioId;

  @override
  String toString() {
    return 'EventEntity.needRunDeviceScenario(scenarioId: $scenarioId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeedRunDeviceScenarioEventEntityImpl &&
            (identical(other.scenarioId, scenarioId) ||
                other.scenarioId == scenarioId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scenarioId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NeedRunDeviceScenarioEventEntityImplCopyWith<
          _$NeedRunDeviceScenarioEventEntityImpl>
      get copyWith => __$$NeedRunDeviceScenarioEventEntityImplCopyWithImpl<
          _$NeedRunDeviceScenarioEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
  }) {
    return needRunDeviceScenario(this);
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return needRunDeviceScenario?.call(this);
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (needRunDeviceScenario != null) {
      return needRunDeviceScenario(this);
    }
    return orElse();
  }
}

abstract class NeedRunDeviceScenarioEventEntity extends EventEntity {
  const factory NeedRunDeviceScenarioEventEntity(
      {required final int scenarioId}) = _$NeedRunDeviceScenarioEventEntityImpl;
  const NeedRunDeviceScenarioEventEntity._() : super._();

  int get scenarioId;
  @JsonKey(ignore: true)
  _$$NeedRunDeviceScenarioEventEntityImplCopyWith<
          _$NeedRunDeviceScenarioEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermitJoinZigbeeDevicesEventEntityImplCopyWith<$Res> {
  factory _$$PermitJoinZigbeeDevicesEventEntityImplCopyWith(
          _$PermitJoinZigbeeDevicesEventEntityImpl value,
          $Res Function(_$PermitJoinZigbeeDevicesEventEntityImpl) then) =
      __$$PermitJoinZigbeeDevicesEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value, int time});
}

/// @nodoc
class __$$PermitJoinZigbeeDevicesEventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res,
        _$PermitJoinZigbeeDevicesEventEntityImpl>
    implements _$$PermitJoinZigbeeDevicesEventEntityImplCopyWith<$Res> {
  __$$PermitJoinZigbeeDevicesEventEntityImplCopyWithImpl(
      _$PermitJoinZigbeeDevicesEventEntityImpl _value,
      $Res Function(_$PermitJoinZigbeeDevicesEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? time = null,
  }) {
    return _then(_$PermitJoinZigbeeDevicesEventEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PermitJoinZigbeeDevicesEventEntityImpl
    extends PermitJoinZigbeeDevicesEventEntity {
  const _$PermitJoinZigbeeDevicesEventEntityImpl(
      {required this.value, required this.time})
      : super._();

  @override
  final bool value;
  @override
  final int time;

  @override
  String toString() {
    return 'EventEntity.permitJoinZigbeeDevices(value: $value, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitJoinZigbeeDevicesEventEntityImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitJoinZigbeeDevicesEventEntityImplCopyWith<
          _$PermitJoinZigbeeDevicesEventEntityImpl>
      get copyWith => __$$PermitJoinZigbeeDevicesEventEntityImplCopyWithImpl<
          _$PermitJoinZigbeeDevicesEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCreatedEventEntity value) deviceCreated,
    required TResult Function(DeviceUpdatedEventEntity value) deviceUpdated,
    required TResult Function(DeviceDeletedEventEntity value) deviceDeleted,
    required TResult Function(RoomCreatedEventEntity value) roomCreated,
    required TResult Function(RoomUpdatedEventEntity value) roomUpdated,
    required TResult Function(RoomDeletedEventEntity value) roomDeleted,
    required TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(DeviceStateChangedEventEntity value)
        deviceStateChanged,
    required TResult Function(NeedRunDeviceScenarioEventEntity value)
        needRunDeviceScenario,
    required TResult Function(PermitJoinZigbeeDevicesEventEntity value)
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices(this);
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
    TResult? Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult? Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult? Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices?.call(this);
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
    TResult Function(NeedDeviceCapabilitiesChangeEventEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceStateChangedEventEntity value)? deviceStateChanged,
    TResult Function(NeedRunDeviceScenarioEventEntity value)?
        needRunDeviceScenario,
    TResult Function(PermitJoinZigbeeDevicesEventEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (permitJoinZigbeeDevices != null) {
      return permitJoinZigbeeDevices(this);
    }
    return orElse();
  }
}

abstract class PermitJoinZigbeeDevicesEventEntity extends EventEntity {
  const factory PermitJoinZigbeeDevicesEventEntity(
      {required final bool value,
      required final int time}) = _$PermitJoinZigbeeDevicesEventEntityImpl;
  const PermitJoinZigbeeDevicesEventEntity._() : super._();

  bool get value;
  int get time;
  @JsonKey(ignore: true)
  _$$PermitJoinZigbeeDevicesEventEntityImplCopyWith<
          _$PermitJoinZigbeeDevicesEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
