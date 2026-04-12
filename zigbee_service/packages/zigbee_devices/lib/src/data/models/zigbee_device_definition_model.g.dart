// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zigbee_device_definition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZigbeeDeviceDefinitionModel _$ZigbeeDeviceDefinitionModelFromJson(
        Map<String, dynamic> json) =>
    _ZigbeeDeviceDefinitionModel(
      vendor: json['vendor'] as String,
      model: json['model'] as String,
      supportsOta: json['supports_ota'] as bool,
      source: json['source'] as String,
      exposes: (json['exposes'] as List<dynamic>)
          .map((e) =>
              ZigbeeDeviceExposeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      description: json['description'] as String,
    );
