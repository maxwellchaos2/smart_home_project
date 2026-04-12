// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionChangeDeviceStateRequestModelImpl
    _$$ActionChangeDeviceStateRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ActionChangeDeviceStateRequestModelImpl(
          deviceId: (json['device_id'] as num).toInt(),
          state: json['state'] as Map<String, dynamic>,
          $type: json['type'] as String?,
        );

_$ActionDelayRequestModelImpl _$$ActionDelayRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionDelayRequestModelImpl(
      seconds: (json['seconds'] as num).toInt(),
      $type: json['type'] as String?,
    );
