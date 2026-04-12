// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionChangeDeviceStateModelImpl _$$ActionChangeDeviceStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionChangeDeviceStateModelImpl(
      deviceId: (json['device_id'] as num).toInt(),
      state: json['state'] as Map<String, dynamic>,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ActionChangeDeviceStateModelImplToJson(
        _$ActionChangeDeviceStateModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };

_$ActionDelayModelImpl _$$ActionDelayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionDelayModelImpl(
      seconds: (json['seconds'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ActionDelayModelImplToJson(
        _$ActionDelayModelImpl instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'type': instance.$type,
    };
