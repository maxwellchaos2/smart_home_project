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
      iconMediaPath: json['icon_media_path'] as String?,
      disabledIconMediaPath: json['disabled_icon_media_path'] as String?,
      deviceId: (json['device_id'] as num).toInt(),
    );

Map<String, dynamic> _$$DevicePositionModelImplToJson(
        _$DevicePositionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'angle': instance.angle,
      'icon_media_path': instance.iconMediaPath,
      'disabled_icon_media_path': instance.disabledIconMediaPath,
      'device_id': instance.deviceId,
    };
