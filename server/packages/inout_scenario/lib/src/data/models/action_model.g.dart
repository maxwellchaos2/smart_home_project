// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionChangeOutputModelImpl _$$ActionChangeOutputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionChangeOutputModelImpl(
      deviceId: json['device_id'] as String,
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ActionChangeOutputModelImplToJson(
        _$ActionChangeOutputModelImpl instance) =>
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
