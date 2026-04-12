// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionChangeOutputRequestModelImpl
    _$$ActionChangeOutputRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$ActionChangeOutputRequestModelImpl(
          deviceId: json['deviceId'] as String,
          state: json['state'] as bool?,
          $type: json['type'] as String?,
        );

_$ActionDelayRequestModelImpl _$$ActionDelayRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionDelayRequestModelImpl(
      seconds: (json['seconds'] as num).toInt(),
      $type: json['type'] as String?,
    );
