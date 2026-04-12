// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceResponseModelImpl _$$DeviceResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceResponseModelImpl(
      id: (json['id'] as num).toInt(),
      providerType: json['provider_type'] as String,
      providerDeviceId: json['provider_device_id'] as String?,
      type: json['type'] as String,
      inputId: (json['input_id'] as num?)?.toInt(),
      outputId: (json['output_id'] as num?)?.toInt(),
      name: json['name'] as String,
      capabilities: (json['capabilities'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      properties: (json['properties'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      roomId: (json['room_id'] as num?)?.toInt(),
      floorId: (json['floor_id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num).toInt(),
    );
