// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yandex_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YandexDeviceModel _$YandexDeviceModelFromJson(Map<String, dynamic> json) =>
    _YandexDeviceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      skillId: json['skill_id'] as String?,
      capabilities: (json['capabilities'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      properties: (json['properties'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
