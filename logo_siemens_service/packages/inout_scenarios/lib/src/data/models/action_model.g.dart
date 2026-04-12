// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangeDeviceImpl _$$ChangeDeviceImplFromJson(Map<String, dynamic> json) =>
    _$ChangeDeviceImpl(
      deviceId: json['deviceId'] as String,
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ChangeDeviceImplToJson(_$ChangeDeviceImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };

_$DelayImpl _$$DelayImplFromJson(Map<String, dynamic> json) => _$DelayImpl(
      seconds: (json['seconds'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DelayImplToJson(_$DelayImpl instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'type': instance.$type,
    };
