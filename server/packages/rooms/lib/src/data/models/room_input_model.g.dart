// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomInputModelImpl _$$RoomInputModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomInputModelImpl(
      name: json['name'] as String,
      floorId: (json['floor_id'] as num).toInt(),
      planMediaPath: json['plan_media_path'] as String?,
    );

Map<String, dynamic> _$$RoomInputModelImplToJson(
        _$RoomInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'floor_id': instance.floorId,
      'plan_media_path': instance.planMediaPath,
    };
