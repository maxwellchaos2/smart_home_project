// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceControllerInputModelImpl _$$DeviceControllerInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceControllerInputModelImpl(
      id: (json['id'] as num).toInt(),
      provider: json['provider'] as String,
      providerDeviceId: json['provider_device_id'] as String?,
      type: json['type'] as String,
      inputId: (json['input_id'] as num?)?.toInt(),
      outputId: (json['output_id'] as num?)?.toInt(),
      name: json['name'] as String,
      isHidden: json['is_hidden'] as bool? ?? false,
      capabilities: json['capabilities'] as List<dynamic>,
      properties: json['properties'] as List<dynamic>,
      createdAt: fromJsonDateTime(json['created_at']),
      updatedAt: fromJsonDateTime(json['updated_at']),
      roomId: (json['room_id'] as num?)?.toInt(),
      floorId: (json['floor_id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num).toInt(),
      customData: json['custom_data'] as Map<String, dynamic>?,
      lastHeartbeat: fromJsonDateTime(json['last_heartbeat']),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$DeviceControllerInputModelImplToJson(
        _$DeviceControllerInputModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
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
