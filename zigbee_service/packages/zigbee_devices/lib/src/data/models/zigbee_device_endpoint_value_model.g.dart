// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zigbee_device_endpoint_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZigbeeDeviceEndpointValueModel _$ZigbeeDeviceEndpointValueModelFromJson(
        Map<String, dynamic> json) =>
    _ZigbeeDeviceEndpointValueModel(
      name: json['name'] as String?,
      clusters: json['clusters'] as Map<String, dynamic>,
      bindings: json['bindings'] as List<dynamic>,
      configuredReportings: json['configured_reportings'] as List<dynamic>,
      scenes: json['scenes'] as List<dynamic>?,
    );
