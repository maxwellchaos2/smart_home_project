// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorModelImpl _$$FloorModelImplFromJson(Map<String, dynamic> json) =>
    _$FloorModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      projectId: (json['projectId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      planMediaPath: json['planMediaPath'] as String?,
    );
