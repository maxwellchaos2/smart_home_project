// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_capability_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCapabilityOnOffEntityImpl _$$DeviceCapabilityOnOffEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceCapabilityOnOffEntityImpl(
      reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityOnOffEntityImplToJson(
        _$DeviceCapabilityOnOffEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DeviceCapabilityColorSettingEntityImpl
    _$$DeviceCapabilityColorSettingEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityColorSettingEntityImpl(
          reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityColorSettingEntityImplToJson(
        _$DeviceCapabilityColorSettingEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DeviceCapabilityRangeEntityImpl _$$DeviceCapabilityRangeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceCapabilityRangeEntityImpl(
      reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityRangeEntityImplToJson(
        _$DeviceCapabilityRangeEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DeviceCapabilityModeEntityImpl _$$DeviceCapabilityModeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceCapabilityModeEntityImpl(
      reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityModeEntityImplToJson(
        _$DeviceCapabilityModeEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DeviceCapabilityFloatEntityImpl _$$DeviceCapabilityFloatEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceCapabilityFloatEntityImpl(
      reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityFloatEntityImplToJson(
        _$DeviceCapabilityFloatEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };

_$DeviceCapabilityUnknownEntityImpl
    _$$DeviceCapabilityUnknownEntityImplFromJson(Map<String, dynamic> json) =>
        _$DeviceCapabilityUnknownEntityImpl(
          reportable: json['reportable'] as bool?,
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

Map<String, dynamic> _$$DeviceCapabilityUnknownEntityImplToJson(
        _$DeviceCapabilityUnknownEntityImpl instance) =>
    <String, dynamic>{
      'reportable': instance.reportable,
      'state': instance.state?.toJson(),
      'parameters': instance.parameters?.toJson(),
      'type': instance.$type,
    };
