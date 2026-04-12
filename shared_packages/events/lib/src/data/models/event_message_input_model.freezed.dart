// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_message_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventMessageInputModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessageNeedDeviceChangeModelImpl
    extends _EventMessageNeedDeviceChangeModel {
  const _$EventMessageNeedDeviceChangeModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<Map<String, dynamic>> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'needDeviceCapabilitiesChange',
        super._();

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
  final List<Map<String, dynamic>> _capabilities;
  @override
  List<Map<String, dynamic>> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventMessageInputModel.needDeviceCapabilitiesChange(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageNeedDeviceChangeModelImpl &&
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
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (needDeviceCapabilitiesChange != null) {
      return needDeviceCapabilitiesChange(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMessageNeedDeviceChangeModelImplToJson(
      this,
    );
  }
}

abstract class _EventMessageNeedDeviceChangeModel
    extends EventMessageInputModel {
  const factory _EventMessageNeedDeviceChangeModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<Map<String, dynamic>> capabilities}) =
      _$EventMessageNeedDeviceChangeModelImpl;
  const _EventMessageNeedDeviceChangeModel._() : super._();

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<Map<String, dynamic>> get capabilities;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessageDeviceCapabilitiesChangedModelImpl
    extends _EventMessageDeviceCapabilitiesChangedModel {
  const _$EventMessageDeviceCapabilitiesChangedModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<Map<String, dynamic>> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'deviceCapabilitiesChanged',
        super._();

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
  final List<Map<String, dynamic>> _capabilities;
  @override
  List<Map<String, dynamic>> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventMessageInputModel.deviceCapabilitiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDeviceCapabilitiesChangedModelImpl &&
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
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) {
    return deviceCapabilitiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (deviceCapabilitiesChanged != null) {
      return deviceCapabilitiesChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMessageDeviceCapabilitiesChangedModelImplToJson(
      this,
    );
  }
}

abstract class _EventMessageDeviceCapabilitiesChangedModel
    extends EventMessageInputModel {
  const factory _EventMessageDeviceCapabilitiesChangedModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<Map<String, dynamic>> capabilities}) =
      _$EventMessageDeviceCapabilitiesChangedModelImpl;
  const _EventMessageDeviceCapabilitiesChangedModel._() : super._();

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<Map<String, dynamic>> get capabilities;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessageDevicePropertiesChangedModelImpl
    extends _EventMessageDevicePropertiesChangedModel {
  const _$EventMessageDevicePropertiesChangedModelImpl(
      {this.deviceId,
      this.providerType,
      this.providerDeviceId,
      required final List<Map<String, dynamic>> properties,
      final String? $type})
      : _properties = properties,
        $type = $type ?? 'devicePropertiesChanged',
        super._();

  @override
  final int? deviceId;
  @override
  final String? providerType;
  @override
  final String? providerDeviceId;
  final List<Map<String, dynamic>> _properties;
  @override
  List<Map<String, dynamic>> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventMessageInputModel.devicePropertiesChanged(deviceId: $deviceId, providerType: $providerType, providerDeviceId: $providerDeviceId, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDevicePropertiesChangedModelImpl &&
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
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) {
    return devicePropertiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (devicePropertiesChanged != null) {
      return devicePropertiesChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMessageDevicePropertiesChangedModelImplToJson(
      this,
    );
  }
}

abstract class _EventMessageDevicePropertiesChangedModel
    extends EventMessageInputModel {
  const factory _EventMessageDevicePropertiesChangedModel(
          {final int? deviceId,
          final String? providerType,
          final String? providerDeviceId,
          required final List<Map<String, dynamic>> properties}) =
      _$EventMessageDevicePropertiesChangedModelImpl;
  const _EventMessageDevicePropertiesChangedModel._() : super._();

  int? get deviceId;
  String? get providerType;
  String? get providerDeviceId;
  List<Map<String, dynamic>> get properties;
}

/// @nodoc

@JsonSerializable()
class _$EventMessageNewZigbeeDeviceModelImpl
    extends _EventMessageNewZigbeeDeviceModel {
  const _$EventMessageNewZigbeeDeviceModelImpl(
      {required final Map<String, dynamic> device, final String? $type})
      : _device = device,
        $type = $type ?? 'newZigbeeDevice',
        super._();

  final Map<String, dynamic> _device;
  @override
  Map<String, dynamic> get device {
    if (_device is EqualUnmodifiableMapView) return _device;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_device);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventMessageInputModel.newZigbeeDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageNewZigbeeDeviceModelImpl &&
            const DeepCollectionEquality().equals(other._device, _device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_device));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) {
    return newZigbeeDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (newZigbeeDevice != null) {
      return newZigbeeDevice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMessageNewZigbeeDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _EventMessageNewZigbeeDeviceModel
    extends EventMessageInputModel {
  const factory _EventMessageNewZigbeeDeviceModel(
          {required final Map<String, dynamic> device}) =
      _$EventMessageNewZigbeeDeviceModelImpl;
  const _EventMessageNewZigbeeDeviceModel._() : super._();

  Map<String, dynamic> get device;
}

/// @nodoc

@JsonSerializable()
class _$OnDeviceHeartbeatEventMessageInputModelImpl
    extends _OnDeviceHeartbeatEventMessageInputModel {
  const _$OnDeviceHeartbeatEventMessageInputModelImpl(
      {required this.deviceId, final String? $type})
      : $type = $type ?? 'onDeviceHeartbeat',
        super._();

  @override
  final int deviceId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'EventMessageInputModel.onDeviceHeartbeat(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeviceHeartbeatEventMessageInputModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)
        deviceCapabilitiesChanged,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessageNewZigbeeDeviceModel value)
        newZigbeeDevice,
    required TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult? Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
  }) {
    return onDeviceHeartbeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDeviceCapabilitiesChangedModel value)?
        deviceCapabilitiesChanged,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessageNewZigbeeDeviceModel value)? newZigbeeDevice,
    TResult Function(_OnDeviceHeartbeatEventMessageInputModel value)?
        onDeviceHeartbeat,
    required TResult orElse(),
  }) {
    if (onDeviceHeartbeat != null) {
      return onDeviceHeartbeat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OnDeviceHeartbeatEventMessageInputModelImplToJson(
      this,
    );
  }
}

abstract class _OnDeviceHeartbeatEventMessageInputModel
    extends EventMessageInputModel {
  const factory _OnDeviceHeartbeatEventMessageInputModel(
          {required final int deviceId}) =
      _$OnDeviceHeartbeatEventMessageInputModelImpl;
  const _OnDeviceHeartbeatEventMessageInputModel._() : super._();

  int get deviceId;
}
