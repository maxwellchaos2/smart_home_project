// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCreatedImpl _$$DeviceCreatedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceCreatedImpl(
      deviceId: (json['device_id'] as num).toInt(),
      device: DeviceModel.fromJson(json['device'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceCreatedImplToJson(_$DeviceCreatedImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'device': instance.device.toJson(),
      'type': instance.$type,
    };

_$DeviceUpdatedImpl _$$DeviceUpdatedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceUpdatedImpl(
      deviceId: (json['device_id'] as num).toInt(),
      device: DeviceModel.fromJson(json['device'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceUpdatedImplToJson(_$DeviceUpdatedImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'device': instance.device.toJson(),
      'type': instance.$type,
    };

_$DeviceDeletedImpl _$$DeviceDeletedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceDeletedImpl(
      deviceId: (json['device_id'] as num).toInt(),
      device: DeviceModel.fromJson(json['device'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceDeletedImplToJson(_$DeviceDeletedImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'device': instance.device.toJson(),
      'type': instance.$type,
    };
