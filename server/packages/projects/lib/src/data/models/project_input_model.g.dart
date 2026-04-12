// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectInputModelImpl _$$ProjectInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectInputModelImpl(
      name: json['name'] as String,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ProjectInputModelImplToJson(
        _$ProjectInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'user_id': instance.userId,
    };
