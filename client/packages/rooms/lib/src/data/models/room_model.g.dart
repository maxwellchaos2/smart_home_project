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
      planMediaPath: json['plan_media_path'] as String?,
    );
