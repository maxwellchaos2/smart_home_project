// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevicePositionModelImpl _$$DevicePositionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DevicePositionModelImpl(
      id: (json['id'] as num).toInt(),
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      angle: (json['angle'] as num).toDouble(),
      iconMediaPath: json['iconMediaPath'] as String?,
      disabledIconMediaPath: json['disabledIconMediaPath'] as String?,
      deviceId: (json['deviceId'] as num).toInt(),
    );
