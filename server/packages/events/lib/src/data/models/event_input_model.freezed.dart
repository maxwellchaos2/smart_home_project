// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventInputModel {
  int get deviceId => throw _privateConstructorUsedError;
  DeviceModel get device => throw _privateConstructorUsedError;

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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceCreatedImpl extends _DeviceCreated {
  const _$DeviceCreatedImpl(
      {required this.deviceId, required this.device, final String? $type})
      : $type = $type ?? 'deviceCreated',
        super._();

  @override
  final int deviceId;
  @override
  final DeviceModel device;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventInputModel.deviceCreated(deviceId: $deviceId, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCreatedImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, device);

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

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCreatedImplToJson(
      this,
    );
  }
}

abstract class _DeviceCreated extends EventInputModel {
  const factory _DeviceCreated(
      {required final int deviceId,
      required final DeviceModel device}) = _$DeviceCreatedImpl;
  const _DeviceCreated._() : super._();

  @override
  int get deviceId;
  @override
  DeviceModel get device;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceUpdatedImpl extends _DeviceUpdated {
  const _$DeviceUpdatedImpl(
      {required this.deviceId, required this.device, final String? $type})
      : $type = $type ?? 'deviceUpdated',
        super._();

  @override
  final int deviceId;
  @override
  final DeviceModel device;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventInputModel.deviceUpdated(deviceId: $deviceId, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceUpdatedImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, device);

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

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceUpdatedImplToJson(
      this,
    );
  }
}

abstract class _DeviceUpdated extends EventInputModel {
  const factory _DeviceUpdated(
      {required final int deviceId,
      required final DeviceModel device}) = _$DeviceUpdatedImpl;
  const _DeviceUpdated._() : super._();

  @override
  int get deviceId;
  @override
  DeviceModel get device;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceDeletedImpl extends _DeviceDeleted {
  const _$DeviceDeletedImpl(
      {required this.deviceId, required this.device, final String? $type})
      : $type = $type ?? 'deviceDeleted',
        super._();

  @override
  final int deviceId;
  @override
  final DeviceModel device;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventInputModel.deviceDeleted(deviceId: $deviceId, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeletedImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, device);

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

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceDeletedImplToJson(
      this,
    );
  }
}

abstract class _DeviceDeleted extends EventInputModel {
  const factory _DeviceDeleted(
      {required final int deviceId,
      required final DeviceModel device}) = _$DeviceDeletedImpl;
  const _DeviceDeleted._() : super._();

  @override
  int get deviceId;
  @override
  DeviceModel get device;
}
