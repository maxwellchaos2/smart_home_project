// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_message_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventMessageInputEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$EventMessageInputEntityImpl implements _EventMessageInputEntity {
  const _$EventMessageInputEntityImpl(
      {required this.deviceId,
      required final List<DeviceCapabilityEntity> capabilities})
      : _capabilities = capabilities;

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
    return 'EventMessageInputEntity.needDeviceCapabilitiesChange(deviceId: $deviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageInputEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId,
      const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (needDeviceCapabilitiesChange != null) {
      return needDeviceCapabilitiesChange(this);
    }
    return orElse();
  }
}

abstract class _EventMessageInputEntity implements EventMessageInputEntity {
  const factory _EventMessageInputEntity(
          {required final int deviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$EventMessageInputEntityImpl;

  int get deviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc

class _$EventMessageDevicePropertiesChangedEntityImpl
    implements _EventMessageDevicePropertiesChangedEntity {
  const _$EventMessageDevicePropertiesChangedEntityImpl(
      {required this.deviceId,
      required final List<DevicePropertyEntity> properties})
      : _properties = properties;

  @override
  final int deviceId;
  final List<DevicePropertyEntity> _properties;
  @override
  List<DevicePropertyEntity> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'EventMessageInputEntity.devicePropertiesChanged(deviceId: $deviceId, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDevicePropertiesChangedEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_properties));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)
        permitJoinZigbeeDevices,
  }) {
    return devicePropertiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return devicePropertiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (devicePropertiesChanged != null) {
      return devicePropertiesChanged(this);
    }
    return orElse();
  }
}

abstract class _EventMessageDevicePropertiesChangedEntity
    implements EventMessageInputEntity {
  const factory _EventMessageDevicePropertiesChangedEntity(
          {required final int deviceId,
          required final List<DevicePropertyEntity> properties}) =
      _$EventMessageDevicePropertiesChangedEntityImpl;

  int get deviceId;
  List<DevicePropertyEntity> get properties;
}

/// @nodoc

class _$EventMessagePermitJoinZigbeeDevicesEntityImpl
    implements _EventMessagePermitJoinZigbeeDevicesEntity {
  const _$EventMessagePermitJoinZigbeeDevicesEntityImpl(
      {required this.projectId, required this.value, required this.time});

  @override
  final int projectId;
  @override
  final bool value;
  @override
  final int time;

  @override
  String toString() {
    return 'EventMessageInputEntity.permitJoinZigbeeDevices(projectId: $projectId, value: $value, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessagePermitJoinZigbeeDevicesEntityImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, value, time);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesEntity value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (permitJoinZigbeeDevices != null) {
      return permitJoinZigbeeDevices(this);
    }
    return orElse();
  }
}

abstract class _EventMessagePermitJoinZigbeeDevicesEntity
    implements EventMessageInputEntity {
  const factory _EventMessagePermitJoinZigbeeDevicesEntity(
          {required final int projectId,
          required final bool value,
          required final int time}) =
      _$EventMessagePermitJoinZigbeeDevicesEntityImpl;

  int get projectId;
  bool get value;
  int get time;
}
