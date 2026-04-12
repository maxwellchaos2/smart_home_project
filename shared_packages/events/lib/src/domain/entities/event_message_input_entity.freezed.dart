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
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$EventMessageInputEntityImpl implements _EventMessageInputEntity {
  const _$EventMessageInputEntityImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DeviceCapabilityEntity> capabilities})
      : _capabilities = capabilities;

  @override
  final int? deviceId;
  @override
  final DeviceProviderType? providerType;
  @override
  final String? providerDeviceId;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @override
  String toString() {
    return 'EventMessageInputEntity.needDeviceCapabilitiesChange(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageInputEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
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
          {final int? deviceId,
          final DeviceProviderType? providerType,
          final String? providerDeviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$EventMessageInputEntityImpl;

  int? get deviceId;
  DeviceProviderType? get providerType;
  String? get providerDeviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc

class _$EventMessageDeviceCapabilitiesChangedEntityImpl
    implements _EventMessageDeviceCapabilitiesChangedEntity {
  const _$EventMessageDeviceCapabilitiesChangedEntityImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DeviceCapabilityEntity> capabilities})
      : _capabilities = capabilities;

  @override
  final int? deviceId;
  @override
  final DeviceProviderType? providerType;
  @override
  final String? providerDeviceId;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @override
  String toString() {
    return 'EventMessageInputEntity.deviceCapabilitiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDeviceCapabilitiesChangedEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (deviceCapabilitiesChanged != null) {
      return deviceCapabilitiesChanged(this);
    }
    return orElse();
  }
}

abstract class _EventMessageDeviceCapabilitiesChangedEntity
    implements EventMessageInputEntity {
  const factory _EventMessageDeviceCapabilitiesChangedEntity(
          {final int? deviceId,
          final DeviceProviderType? providerType,
          final String? providerDeviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$EventMessageDeviceCapabilitiesChangedEntityImpl;

  int? get deviceId;
  DeviceProviderType? get providerType;
  String? get providerDeviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc

class _$EventMessageDevicePropertiesChangedEntityImpl
    implements _EventMessageDevicePropertiesChangedEntity {
  const _$EventMessageDevicePropertiesChangedEntityImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DevicePropertyEntity> properties})
      : _properties = properties;

  @override
  final int? deviceId;
  @override
  final DeviceProviderType? providerType;
  @override
  final String? providerDeviceId;
  final List<DevicePropertyEntity> _properties;
  @override
  List<DevicePropertyEntity> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'EventMessageInputEntity.devicePropertiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDevicePropertiesChangedEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_properties));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
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
          {final int? deviceId,
          final DeviceProviderType? providerType,
          final String? providerDeviceId,
          required final List<DevicePropertyEntity> properties}) =
      _$EventMessageDevicePropertiesChangedEntityImpl;

  int? get deviceId;
  DeviceProviderType? get providerType;
  String? get providerDeviceId;
  List<DevicePropertyEntity> get properties;
}

/// @nodoc

class _$EventMessageNewZigbeeDeviceEntityImpl
    implements _EventMessageNewZigbeeDeviceEntity {
  const _$EventMessageNewZigbeeDeviceEntityImpl(
      {required final Map<String, dynamic> device})
      : _device = device;

  final Map<String, dynamic> _device;
  @override
  Map<String, dynamic> get device {
    if (_device is EqualUnmodifiableMapView) return _device;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_device);
  }

  @override
  String toString() {
    return 'EventMessageInputEntity.newZigbeeDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageNewZigbeeDeviceEntityImpl &&
            const DeepCollectionEquality().equals(other._device, _device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_device));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (newZigbeeDevice != null) {
      return newZigbeeDevice(this);
    }
    return orElse();
  }
}

abstract class _EventMessageNewZigbeeDeviceEntity
    implements EventMessageInputEntity {
  const factory _EventMessageNewZigbeeDeviceEntity(
          {required final Map<String, dynamic> device}) =
      _$EventMessageNewZigbeeDeviceEntityImpl;

  Map<String, dynamic> get device;
}

/// @nodoc

class _$OnDeviceHeartbeatEventMessageInputEntityImpl
    implements _OnDeviceHeartbeatEventMessageInputEntity {
  const _$OnDeviceHeartbeatEventMessageInputEntityImpl(
      {required this.deviceId});

  @override
  final int deviceId;

  @override
  String toString() {
    return 'EventMessageInputEntity.onDeviceHeartbeat(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeviceHeartbeatEventMessageInputEntityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageInputEntity value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            _EventMessageDeviceCapabilitiesChangedEntity value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedEntity value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceEntity value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceEntity value)?
        newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageInputEntity value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedEntity value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedEntity value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceEntity value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputEntity value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (onDeviceHeartbeat != null) {
      return onDeviceHeartbeat(this);
    }
    return orElse();
  }
}

abstract class _OnDeviceHeartbeatEventMessageInputEntity
    implements EventMessageInputEntity {
  const factory _OnDeviceHeartbeatEventMessageInputEntity(
          {required final int deviceId}) =
      _$OnDeviceHeartbeatEventMessageInputEntityImpl;

  int get deviceId;
}
