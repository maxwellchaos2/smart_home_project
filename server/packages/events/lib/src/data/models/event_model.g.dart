// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCreatedImpl _$$DeviceCreatedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceCreatedImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['device_id'] as num).toInt(),
      device: deviceModelFromJson(json['device'] as Map<String, Object?>),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceCreatedImplToJson(_$DeviceCreatedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
      'device': deviceToJson(instance.device),
      'created_at': instance.createdAt.toIso8601String(),
      'type': instance.$type,
    };

_$DeviceUpdatedImpl _$$DeviceUpdatedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceUpdatedImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['device_id'] as num).toInt(),
      device: deviceModelFromJson(json['device'] as Map<String, Object?>),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceUpdatedImplToJson(_$DeviceUpdatedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
      'device': deviceToJson(instance.device),
      'created_at': instance.createdAt.toIso8601String(),
      'type': instance.$type,
    };

_$DeviceDeletedImpl _$$DeviceDeletedImplFromJson(Map<String, dynamic> json) =>
    _$DeviceDeletedImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['device_id'] as num).toInt(),
      device: deviceModelFromJson(json['device'] as Map<String, Object?>),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DeviceDeletedImplToJson(_$DeviceDeletedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
      'device': deviceToJson(instance.device),
      'created_at': instance.createdAt.toIso8601String(),
      'type': instance.$type,
    };
