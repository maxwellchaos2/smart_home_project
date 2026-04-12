// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zigbee_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZigbeeDeviceModel _$ZigbeeDeviceModelFromJson(Map<String, dynamic> json) =>
    _ZigbeeDeviceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      capabilities: (json['capabilities'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      properties: (json['properties'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
