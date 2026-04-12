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
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this EventMessageInputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessageNeedDeviceChangeModelImpl
    extends _EventMessageNeedDeviceChangeModel {
  const _$EventMessageNeedDeviceChangeModelImpl(
      {required this.deviceId,
      required final List<Map<String, dynamic>> capabilities,
      final String? $type})
      : _capabilities = capabilities,
        $type = $type ?? 'needDeviceCapabilitiesChange',
        super._();

  @override
  final int deviceId;
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
    return 'EventMessageInputModel.needDeviceCapabilitiesChange(deviceId: $deviceId, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageNeedDeviceChangeModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId,
      const DeepCollectionEquality().hash(_capabilities));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return needDeviceCapabilitiesChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
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
          {required final int deviceId,
          required final List<Map<String, dynamic>> capabilities}) =
      _$EventMessageNeedDeviceChangeModelImpl;
  const _EventMessageNeedDeviceChangeModel._() : super._();

  int get deviceId;
  List<Map<String, dynamic>> get capabilities;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessageDevicePropertiesChangedModelImpl
    extends _EventMessageDevicePropertiesChangedModel {
  const _$EventMessageDevicePropertiesChangedModelImpl(
      {required this.deviceId,
      required final List<Map<String, dynamic>> properties,
      final String? $type})
      : _properties = properties,
        $type = $type ?? 'devicePropertiesChanged',
        super._();

  @override
  final int deviceId;
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
    return 'EventMessageInputModel.devicePropertiesChanged(deviceId: $deviceId, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessageDevicePropertiesChangedModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_properties));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return devicePropertiesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return devicePropertiesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
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
          {required final int deviceId,
          required final List<Map<String, dynamic>> properties}) =
      _$EventMessageDevicePropertiesChangedModelImpl;
  const _EventMessageDevicePropertiesChangedModel._() : super._();

  int get deviceId;
  List<Map<String, dynamic>> get properties;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EventMessagePermitJoinZigbeeDevicesModelImpl
    extends _EventMessagePermitJoinZigbeeDevicesModel {
  const _$EventMessagePermitJoinZigbeeDevicesModelImpl(
      {required this.projectId,
      required this.value,
      required this.time,
      final String? $type})
      : $type = $type ?? 'permitJoinZigbeeDevices',
        super._();

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
    return 'EventMessageInputModel.permitJoinZigbeeDevices(projectId: $projectId, value: $value, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMessagePermitJoinZigbeeDevicesModelImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, value, time);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventMessageNeedDeviceChangeModel value)
        needDeviceCapabilitiesChange,
    required TResult Function(_EventMessageDevicePropertiesChangedModel value)
        devicePropertiesChanged,
    required TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult? Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult? Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
  }) {
    return permitJoinZigbeeDevices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventMessageNeedDeviceChangeModel value)?
        needDeviceCapabilitiesChange,
    TResult Function(_EventMessageDevicePropertiesChangedModel value)?
        devicePropertiesChanged,
    TResult Function(_EventMessagePermitJoinZigbeeDevicesModel value)?
        permitJoinZigbeeDevices,
    required TResult orElse(),
  }) {
    if (permitJoinZigbeeDevices != null) {
      return permitJoinZigbeeDevices(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMessagePermitJoinZigbeeDevicesModelImplToJson(
      this,
    );
  }
}

abstract class _EventMessagePermitJoinZigbeeDevicesModel
    extends EventMessageInputModel {
  const factory _EventMessagePermitJoinZigbeeDevicesModel(
          {required final int projectId,
          required final bool value,
          required final int time}) =
      _$EventMessagePermitJoinZigbeeDevicesModelImpl;
  const _EventMessagePermitJoinZigbeeDevicesModel._() : super._();

  int get projectId;
  bool get value;
  int get time;
}
