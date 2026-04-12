// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventResponseModel {
  DateTime get createdAt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceCreatedImpl extends _DeviceCreated {
  const _$DeviceCreatedImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceCreated',
        super._();

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
    return 'EventResponseModel.deviceCreated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCreatedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return deviceCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return deviceCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceCreated != null) {
      return deviceCreated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCreatedImplToJson(
      this,
    );
  }
}

abstract class _DeviceCreated extends EventResponseModel {
  const factory _DeviceCreated(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$DeviceCreatedImpl;
  const _DeviceCreated._() : super._();

  int get id;
  DeviceResponseModel get device;
  @override
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceUpdatedImpl extends _DeviceUpdated {
  const _$DeviceUpdatedImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceUpdated',
        super._();

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
    return 'EventResponseModel.deviceUpdated(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceUpdatedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return deviceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return deviceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceUpdated != null) {
      return deviceUpdated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceUpdatedImplToJson(
      this,
    );
  }
}

abstract class _DeviceUpdated extends EventResponseModel {
  const factory _DeviceUpdated(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$DeviceUpdatedImpl;
  const _DeviceUpdated._() : super._();

  int get id;
  DeviceResponseModel get device;
  @override
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceDeletedImpl extends _DeviceDeleted {
  const _$DeviceDeletedImpl(
      {required this.id,
      required this.device,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'deviceDeleted',
        super._();

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
    return 'EventResponseModel.deviceDeleted(id: $id, device: $device, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeletedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return deviceDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return deviceDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (deviceDeleted != null) {
      return deviceDeleted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceDeletedImplToJson(
      this,
    );
  }
}

abstract class _DeviceDeleted extends EventResponseModel {
  const factory _DeviceDeleted(
      {required final int id,
      required final DeviceResponseModel device,
      required final DateTime createdAt}) = _$DeviceDeletedImpl;
  const _DeviceDeleted._() : super._();

  int get id;
  DeviceResponseModel get device;
  @override
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$RoomCreatedImpl extends _RoomCreated {
  const _$RoomCreatedImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomCreated',
        super._();

  @override
  final RoomResponseModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventResponseModel.roomCreated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCreatedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return roomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return roomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomCreatedImplToJson(
      this,
    );
  }
}

abstract class _RoomCreated extends EventResponseModel {
  const factory _RoomCreated(
      {required final RoomResponseModel room,
      required final DateTime createdAt}) = _$RoomCreatedImpl;
  const _RoomCreated._() : super._();

  RoomResponseModel get room;
  @override
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$RoomUpdatedImpl extends _RoomUpdated {
  const _$RoomUpdatedImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomUpdated',
        super._();

  @override
  final RoomResponseModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventResponseModel.roomUpdated(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomUpdatedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return roomUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return roomUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomUpdated != null) {
      return roomUpdated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomUpdatedImplToJson(
      this,
    );
  }
}

abstract class _RoomUpdated extends EventResponseModel {
  const factory _RoomUpdated(
      {required final RoomResponseModel room,
      required final DateTime createdAt}) = _$RoomUpdatedImpl;
  const _RoomUpdated._() : super._();

  RoomResponseModel get room;
  @override
  DateTime get createdAt;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$RoomDeletedImpl extends _RoomDeleted {
  const _$RoomDeletedImpl(
      {required this.room, required this.createdAt, final String? $type})
      : $type = $type ?? 'roomDeleted',
        super._();

  @override
  final RoomResponseModel room;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventResponseModel.roomDeleted(room: $room, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDeletedImpl &&
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
    required TResult Function(_DeviceCreated value) deviceCreated,
    required TResult Function(_DeviceUpdated value) deviceUpdated,
    required TResult Function(_DeviceDeleted value) deviceDeleted,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_RoomUpdated value) roomUpdated,
    required TResult Function(_RoomDeleted value) roomDeleted,
  }) {
    return roomDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeviceCreated value)? deviceCreated,
    TResult? Function(_DeviceUpdated value)? deviceUpdated,
    TResult? Function(_DeviceDeleted value)? deviceDeleted,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_RoomUpdated value)? roomUpdated,
    TResult? Function(_RoomDeleted value)? roomDeleted,
  }) {
    return roomDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeviceCreated value)? deviceCreated,
    TResult Function(_DeviceUpdated value)? deviceUpdated,
    TResult Function(_DeviceDeleted value)? deviceDeleted,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_RoomUpdated value)? roomUpdated,
    TResult Function(_RoomDeleted value)? roomDeleted,
    required TResult orElse(),
  }) {
    if (roomDeleted != null) {
      return roomDeleted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomDeletedImplToJson(
      this,
    );
  }
}

abstract class _RoomDeleted extends EventResponseModel {
  const factory _RoomDeleted(
      {required final RoomResponseModel room,
      required final DateTime createdAt}) = _$RoomDeletedImpl;
  const _RoomDeleted._() : super._();

  RoomResponseModel get room;
  @override
  DateTime get createdAt;
}
