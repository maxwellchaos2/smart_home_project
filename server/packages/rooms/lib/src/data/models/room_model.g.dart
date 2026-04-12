// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomModelImpl _$$RoomModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      floorId: (json['floor_id'] as num).toInt(),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      updatedAt: dateTimeFromJson(json['updated_at'] as DateTime),
      planMediaPath: json['plan_media_path'] as String?,
      projectId: (json['project_id'] as num).toInt(),
    );

Map<String, dynamic> _$$RoomModelImplToJson(_$RoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'floor_id': instance.floorId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'plan_media_path': instance.planMediaPath,
      'project_id': instance.projectId,
    };
