// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_message_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventMessageNeedDeviceChangeModelImpl
    _$$EventMessageNeedDeviceChangeModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageNeedDeviceChangeModelImpl(
          deviceId: (json['deviceId'] as num).toInt(),
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageNeedDeviceChangeModelImplToJson(
        _$EventMessageNeedDeviceChangeModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'capabilities': instance.capabilities,
      'type': instance.$type,
    };

_$EventMessageDevicePropertiesChangedModelImpl
    _$$EventMessageDevicePropertiesChangedModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageDevicePropertiesChangedModelImpl(
          deviceId: (json['deviceId'] as num).toInt(),
          properties: (json['properties'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageDevicePropertiesChangedModelImplToJson(
        _$EventMessageDevicePropertiesChangedModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'properties': instance.properties,
      'type': instance.$type,
    };

_$EventMessagePermitJoinZigbeeDevicesModelImpl
    _$$EventMessagePermitJoinZigbeeDevicesModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessagePermitJoinZigbeeDevicesModelImpl(
          projectId: (json['projectId'] as num).toInt(),
          value: json['value'] as bool,
          time: (json['time'] as num).toInt(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessagePermitJoinZigbeeDevicesModelImplToJson(
        _$EventMessagePermitJoinZigbeeDevicesModelImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'value': instance.value,
      'time': instance.time,
      'type': instance.$type,
    };
