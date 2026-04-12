// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_capability_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCapabilityStateOnEntityImpl
    _$$DeviceCapabilityStateOnEntityImplFromJson(Map<String, dynamic> json) =>
        _$DeviceCapabilityStateOnEntityImpl(
          value: json['value'] as bool?,
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateOnEntityImplToJson(
        _$DeviceCapabilityStateOnEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateRgbEntityImpl
    _$$DeviceCapabilityStateRgbEntityImplFromJson(Map<String, dynamic> json) =>
        _$DeviceCapabilityStateRgbEntityImpl(
          value: (json['value'] as num).toInt(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateRgbEntityImplToJson(
        _$DeviceCapabilityStateRgbEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateHsvEntityImpl
    _$$DeviceCapabilityStateHsvEntityImplFromJson(Map<String, dynamic> json) =>
        _$DeviceCapabilityStateHsvEntityImpl(
          value: _$recordConvert(
            json['value'],
            ($jsonValue) => (
              h: ($jsonValue['h'] as num).toInt(),
              s: ($jsonValue['s'] as num).toInt(),
              v: ($jsonValue['v'] as num).toInt(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateHsvEntityImplToJson(
        _$DeviceCapabilityStateHsvEntityImpl instance) =>
    <String, dynamic>{
      'value': <String, dynamic>{
        'h': instance.value.h,
        's': instance.value.s,
        'v': instance.value.v,
      },
      'instance': instance.$type,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

_$DeviceCapabilityStateTemperatureKEntityImpl
    _$$DeviceCapabilityStateTemperatureKEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateTemperatureKEntityImpl(
          value: (json['value'] as num).toInt(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateTemperatureKEntityImplToJson(
        _$DeviceCapabilityStateTemperatureKEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateSceneEntityImpl
    _$$DeviceCapabilityStateSceneEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateSceneEntityImpl(
          value: json['value'] as String,
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateSceneEntityImplToJson(
        _$DeviceCapabilityStateSceneEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateTemperatureEntityImpl
    _$$DeviceCapabilityStateTemperatureEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateTemperatureEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateTemperatureEntityImplToJson(
        _$DeviceCapabilityStateTemperatureEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateHumidityEntityImpl
    _$$DeviceCapabilityStateHumidityEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateHumidityEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateHumidityEntityImplToJson(
        _$DeviceCapabilityStateHumidityEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateWorkSpeedEntityImpl
    _$$DeviceCapabilityStateWorkSpeedEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateWorkSpeedEntityImpl(
          value: json['value'] as String,
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateWorkSpeedEntityImplToJson(
        _$DeviceCapabilityStateWorkSpeedEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateBrightnessEntityImpl
    _$$DeviceCapabilityStateBrightnessEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateBrightnessEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateBrightnessEntityImplToJson(
        _$DeviceCapabilityStateBrightnessEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateChannelEntityImpl
    _$$DeviceCapabilityStateChannelEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateChannelEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateChannelEntityImplToJson(
        _$DeviceCapabilityStateChannelEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateVolumeEntityImpl
    _$$DeviceCapabilityStateVolumeEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateVolumeEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateVolumeEntityImplToJson(
        _$DeviceCapabilityStateVolumeEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateOpenEntityImpl
    _$$DeviceCapabilityStateOpenEntityImplFromJson(Map<String, dynamic> json) =>
        _$DeviceCapabilityStateOpenEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateOpenEntityImplToJson(
        _$DeviceCapabilityStateOpenEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateBatteryLevelEntityImpl
    _$$DeviceCapabilityStateBatteryLevelEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateBatteryLevelEntityImpl(
          value: (json['value'] as num).toDouble(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateBatteryLevelEntityImplToJson(
        _$DeviceCapabilityStateBatteryLevelEntityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'instance': instance.$type,
    };

_$DeviceCapabilityStateUnknownEntityImpl
    _$$DeviceCapabilityStateUnknownEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityStateUnknownEntityImpl(
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityStateUnknownEntityImplToJson(
        _$DeviceCapabilityStateUnknownEntityImpl instance) =>
    <String, dynamic>{
      'instance': instance.$type,
    };
