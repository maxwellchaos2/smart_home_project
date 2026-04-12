// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$DeviceResponseModelImplToJson(
        _$DeviceResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider_type': instance.providerType,
      'provider_device_id': instance.providerDeviceId,
      'type': instance.type,
      'input_id': instance.inputId,
      'output_id': instance.outputId,
      'name': instance.name,
      'is_hidden': instance.isHidden,
      'capabilities': instance.capabilities,
      'properties': instance.properties,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'room_id': instance.roomId,
      'floor_id': instance.floorId,
      'project_id': instance.projectId,
      'custom_data': instance.customData,
      'last_heartbeat': instance.lastHeartbeat.toIso8601String(),
      'status': instance.status,
    };
