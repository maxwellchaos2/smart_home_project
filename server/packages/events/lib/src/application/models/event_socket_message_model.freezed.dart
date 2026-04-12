// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_socket_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventSocketMessageModel _$EventSocketMessageModelFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'needDeviceCapabilitiesChange':
      return NeedDeviceCapabilitiesChangeEventSocketMessageModel.fromJson(json);
    case 'deviceCapabilitiesChanged':
      return DeviceCapabilitiesChangedEventSocketMessageModel.fromJson(json);
    case 'devicePropertiesChanged':
      return DevicePropertiesChangedEventSocketMessageModel.fromJson(json);
    case 'perminJoinZigbeeDevices':
      return PerminJoinZigbeeDevicesEventSocketMessageModel.fromJson(json);
    case 'newZigbeeDevice':
      return NewZigbeeDeviceEventSocketMessageModel.fromJson(json);
    case 'onDeviceHeartbeat':
      return OnDeviceHeartbeatEventSocketMessageModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'EventSocketMessageModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$EventSocketMessageModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl
    extends NeedDeviceCapabilitiesChangeEventSocketMessageModel {
  const _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DeviceCapabilityEntity> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'needDeviceCapabilitiesChange',
        super._();

  factory _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NeedDeviceCapabilitiesChangeEventSocketMessageModelImplFromJson(json);

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
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
    return 'EventSocketMessageModel.needDeviceCapabilitiesChange(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (needDeviceCapabilitiesChange != null) {
      return needDeviceCapabilitiesChange(this);
    }
    return orElse();
  }
}

abstract class NeedDeviceCapabilitiesChangeEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory NeedDeviceCapabilitiesChangeEventSocketMessageModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl;
  const NeedDeviceCapabilitiesChangeEventSocketMessageModel._() : super._();

  factory NeedDeviceCapabilitiesChangeEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl.fromJson;

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$DeviceCapabilitiesChangedEventSocketMessageModelImpl
    extends DeviceCapabilitiesChangedEventSocketMessageModel {
  const _$DeviceCapabilitiesChangedEventSocketMessageModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DeviceCapabilityEntity> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'deviceCapabilitiesChanged',
        super._();

  factory _$DeviceCapabilitiesChangedEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilitiesChangedEventSocketMessageModelImplFromJson(json);

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
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
    return 'EventSocketMessageModel.deviceCapabilitiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilitiesChangedEventSocketMessageModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (deviceCapabilitiesChanged != null) {
      return deviceCapabilitiesChanged(this);
    }
    return orElse();
  }
}

abstract class DeviceCapabilitiesChangedEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory DeviceCapabilitiesChangedEventSocketMessageModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<DeviceCapabilityEntity> capabilities}) =
      _$DeviceCapabilitiesChangedEventSocketMessageModelImpl;
  const DeviceCapabilitiesChangedEventSocketMessageModel._() : super._();

  factory DeviceCapabilitiesChangedEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilitiesChangedEventSocketMessageModelImpl.fromJson;

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<DeviceCapabilityEntity> get capabilities;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$DevicePropertiesChangedEventSocketMessageModelImpl
    extends DevicePropertiesChangedEventSocketMessageModel {
  const _$DevicePropertiesChangedEventSocketMessageModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<DevicePropertyEntity> properties,
      final String? $type})
      : _properties = properties,
        $type = $type ?? 'devicePropertiesChanged',
        super._();

  factory _$DevicePropertiesChangedEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DevicePropertiesChangedEventSocketMessageModelImplFromJson(json);

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
  final List<DevicePropertyEntity> _properties;
  @override
  List<DevicePropertyEntity> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventSocketMessageModel.devicePropertiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePropertiesChangedEventSocketMessageModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, providerType,
      providerDeviceId, const DeepCollectionEquality().hash(_properties));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (devicePropertiesChanged != null) {
      return devicePropertiesChanged(this);
    }
    return orElse();
  }
}

abstract class DevicePropertiesChangedEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory DevicePropertiesChangedEventSocketMessageModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<DevicePropertyEntity> properties}) =
      _$DevicePropertiesChangedEventSocketMessageModelImpl;
  const DevicePropertiesChangedEventSocketMessageModel._() : super._();

  factory DevicePropertiesChangedEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$DevicePropertiesChangedEventSocketMessageModelImpl.fromJson;

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<DevicePropertyEntity> get properties;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl
    extends PerminJoinZigbeeDevicesEventSocketMessageModel {
  const _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl(
      {required this.projectId,
      required this.value,
      required this.time,
      final String? $type})
      : $type = $type ?? 'perminJoinZigbeeDevices',
        super._();

  factory _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PerminJoinZigbeeDevicesEventSocketMessageModelImplFromJson(json);

  @override
  final int projectId;
  @override
  final bool value;
  @override
  final int time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventSocketMessageModel.perminJoinZigbeeDevices(projectId: $projectId, value: $value, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, value, time);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return perminJoinZigbeeDevices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return perminJoinZigbeeDevices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (perminJoinZigbeeDevices != null) {
      return perminJoinZigbeeDevices(this);
    }
    return orElse();
  }
}

abstract class PerminJoinZigbeeDevicesEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory PerminJoinZigbeeDevicesEventSocketMessageModel(
          {required final int projectId,
          required final bool value,
          required final int time}) =
      _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl;
  const PerminJoinZigbeeDevicesEventSocketMessageModel._() : super._();

  factory PerminJoinZigbeeDevicesEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl.fromJson;

  int get projectId;
  bool get value;
  int get time;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NewZigbeeDeviceEventSocketMessageModelImpl
    extends NewZigbeeDeviceEventSocketMessageModel {
  const _$NewZigbeeDeviceEventSocketMessageModelImpl(
      {required this.device, final String? $type})
      : $type = $type ?? 'newZigbeeDevice',
        super._();

  factory _$NewZigbeeDeviceEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NewZigbeeDeviceEventSocketMessageModelImplFromJson(json);

  @override
  final ZigbeeDeviceModel device;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventSocketMessageModel.newZigbeeDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewZigbeeDeviceEventSocketMessageModelImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (newZigbeeDevice != null) {
      return newZigbeeDevice(this);
    }
    return orElse();
  }
}

abstract class NewZigbeeDeviceEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory NewZigbeeDeviceEventSocketMessageModel(
          {required final ZigbeeDeviceModel device}) =
      _$NewZigbeeDeviceEventSocketMessageModelImpl;
  const NewZigbeeDeviceEventSocketMessageModel._() : super._();

  factory NewZigbeeDeviceEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$NewZigbeeDeviceEventSocketMessageModelImpl.fromJson;

  ZigbeeDeviceModel get device;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$OnDeviceHeartbeatEventSocketMessageModelImpl
    extends OnDeviceHeartbeatEventSocketMessageModel {
  const _$OnDeviceHeartbeatEventSocketMessageModelImpl(
      {required this.deviceId, final String? $type})
      : $type = $type ?? 'onDeviceHeartbeat',
        super._();

  factory _$OnDeviceHeartbeatEventSocketMessageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OnDeviceHeartbeatEventSocketMessageModelImplFromJson(json);

  @override
  final int deviceId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventSocketMessageModel.onDeviceHeartbeat(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeviceHeartbeatEventSocketMessageModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(
            DeviceCapabilitiesChangedEventSocketMessageModel value)
        deviceCapabilitiesChanged,
    required TResult Function(
            DevicePropertiesChangedEventSocketMessageModel value)
        devicePropertiesChanged,
    required TResult Function(
            PerminJoinZigbeeDevicesEventSocketMessageModel value)
        perminJoinZigbeeDevices,
    required TResult Function(NewZigbeeDeviceEventSocketMessageModel value)
        newZigbeeDevice,
    required TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult? Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult? Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult? Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeedDeviceCapabilitiesChangeEventSocketMessageModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(DeviceCapabilitiesChangedEventSocketMessageModel value)?
        deviceCapabilitiesChanged,
    TResult Function(DevicePropertiesChangedEventSocketMessageModel value)?
        devicePropertiesChanged,
    TResult Function(PerminJoinZigbeeDevicesEventSocketMessageModel value)?
        perminJoinZigbeeDevices,
    TResult Function(NewZigbeeDeviceEventSocketMessageModel value)?
        newZigbeeDevice,
    TResult Function(OnDeviceHeartbeatEventSocketMessageModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (onDeviceHeartbeat != null) {
      return onDeviceHeartbeat(this);
    }
    return orElse();
  }
}

abstract class OnDeviceHeartbeatEventSocketMessageModel
    extends EventSocketMessageModel {
  const factory OnDeviceHeartbeatEventSocketMessageModel(
          {required final int deviceId}) =
      _$OnDeviceHeartbeatEventSocketMessageModelImpl;
  const OnDeviceHeartbeatEventSocketMessageModel._() : super._();

  factory OnDeviceHeartbeatEventSocketMessageModel.fromJson(
          Map<String, dynamic> json) =
      _$OnDeviceHeartbeatEventSocketMessageModelImpl.fromJson;

  int get deviceId;
}
