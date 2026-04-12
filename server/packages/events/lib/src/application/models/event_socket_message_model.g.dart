// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_socket_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl
    _$$NeedDeviceCapabilitiesChangeEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$NeedDeviceCapabilitiesChangeEventSocketMessageModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) =>
                  DeviceCapabilityEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['type'] as String?,
        );

_$DeviceCapabilitiesChangedEventSocketMessageModelImpl
    _$$DeviceCapabilitiesChangedEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilitiesChangedEventSocketMessageModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) =>
                  DeviceCapabilityEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['type'] as String?,
        );

_$DevicePropertiesChangedEventSocketMessageModelImpl
    _$$DevicePropertiesChangedEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$DevicePropertiesChangedEventSocketMessageModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          properties: (json['properties'] as List<dynamic>)
              .map((e) =>
                  DevicePropertyEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['type'] as String?,
        );

_$PerminJoinZigbeeDevicesEventSocketMessageModelImpl
    _$$PerminJoinZigbeeDevicesEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$PerminJoinZigbeeDevicesEventSocketMessageModelImpl(
          projectId: (json['projectId'] as num).toInt(),
          value: json['value'] as bool,
          time: (json['time'] as num).toInt(),
          $type: json['type'] as String?,
        );

_$NewZigbeeDeviceEventSocketMessageModelImpl
    _$$NewZigbeeDeviceEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$NewZigbeeDeviceEventSocketMessageModelImpl(
          device: ZigbeeDeviceModel.fromJson(
              json['device'] as Map<String, dynamic>),
          $type: json['type'] as String?,
        );

_$OnDeviceHeartbeatEventSocketMessageModelImpl
    _$$OnDeviceHeartbeatEventSocketMessageModelImplFromJson(
            Map<String, dynamic> json) =>
        _$OnDeviceHeartbeatEventSocketMessageModelImpl(
          deviceId: (json['deviceId'] as num).toInt(),
          $type: json['type'] as String?,
        );
