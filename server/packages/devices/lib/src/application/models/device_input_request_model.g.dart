// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_input_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceInputControllerInputRequestModelImpl
    _$$DeviceInputControllerInputRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceInputControllerInputRequestModelImpl(
          type: json['type'] as String,
          providerType: json['provider_type'] as String,
          providerDeviceId: json['provider_device_id'] as String?,
          inputId: (json['input_id'] as num?)?.toInt(),
          outputId: (json['output_id'] as num?)?.toInt(),
          isHidden: json['is_hidden'] as bool?,
          name: json['name'] as String,
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          properties: (json['properties'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          roomId: (json['room_id'] as num?)?.toInt(),
          floorId: (json['floor_id'] as num?)?.toInt(),
          customData: json['custom_data'] as Map<String, dynamic>?,
        );
