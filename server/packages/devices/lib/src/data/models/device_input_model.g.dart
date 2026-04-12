// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceControllerInputInputModelImpl
    _$$DeviceControllerInputInputModelImplFromJson(Map<String, dynamic> json) =>
        _$DeviceControllerInputInputModelImpl(
          type: json['type'] as String,
          provider: json['provider'] as String,
          providerDeviceId: json['provider_device_id'] as String?,
          inputId: (json['input_id'] as num?)?.toInt(),
          outputId: (json['output_id'] as num?)?.toInt(),
          isHidden: json['is_hidden'] as bool,
          name: json['name'] as String,
          capabilities: json['capabilities'] as String,
          properties: json['properties'] as String,
          roomId: (json['room_id'] as num?)?.toInt(),
          floorId: (json['floor_id'] as num?)?.toInt(),
          projectId: (json['project_id'] as num).toInt(),
          customData: json['custom_data'] as Map<String, dynamic>?,
        );

Map<String, dynamic> _$$DeviceControllerInputInputModelImplToJson(
        _$DeviceControllerInputInputModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'provider': instance.provider,
      'provider_device_id': instance.providerDeviceId,
      'input_id': instance.inputId,
      'output_id': instance.outputId,
      'is_hidden': instance.isHidden,
      'name': instance.name,
      'capabilities': instance.capabilities,
      'properties': instance.properties,
      'room_id': instance.roomId,
      'floor_id': instance.floorId,
      'project_id': instance.projectId,
      'custom_data': instance.customData,
    };
