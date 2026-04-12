// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_property_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevicePropertyFloatEntityImpl _$$DevicePropertyFloatEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DevicePropertyFloatEntityImpl(
      state: json['state'] == null
          ? null
          : DeviceCapabilityStateEntity.fromJson(
              json['state'] as Map<String, dynamic>),
      parameters: json['parameters'] == null
          ? null
          : DeviceCapabilityParametersEntity.fromJson(
              json['parameters'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DevicePropertyFloatEntityImplToJson(
        _$DevicePropertyFloatEntityImpl instance) =>
    <String, dynamic>{
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DevicePropertyEventEntityImpl _$$DevicePropertyEventEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DevicePropertyEventEntityImpl(
      state: json['state'] as Map<String, dynamic>?,
      parameters: json['parameters'] as Map<String, dynamic>?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DevicePropertyEventEntityImplToJson(
        _$DevicePropertyEventEntityImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'parameters': instance.parameters,
      'type': instance.$type,
    };
