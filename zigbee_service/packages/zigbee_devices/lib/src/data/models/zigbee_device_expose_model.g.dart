// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zigbee_device_expose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZigbeeDeviceExposeModel _$ZigbeeDeviceExposeModelFromJson(
        Map<String, dynamic> json) =>
    _ZigbeeDeviceExposeModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      access: (json['access'] as num?)?.toInt(),
      label: json['label'] as String?,
      name: json['name'] as String?,
      property: json['property'] as String?,
      type: json['type'] as String?,
      valueMax: (json['value_max'] as num?)?.toInt(),
      valueMin: (json['value_min'] as num?)?.toInt(),
      valueStep: (json['value_step'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
