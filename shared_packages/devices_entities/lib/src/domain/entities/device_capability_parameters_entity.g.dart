// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_capability_parameters_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCapabilityParametersOnOffEntityImpl
    _$$DeviceCapabilityParametersOnOffEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersOnOffEntityImpl(
          split: json['split'] as bool?,
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersOnOffEntityImplToJson(
        _$DeviceCapabilityParametersOnOffEntityImpl instance) =>
    <String, dynamic>{
      'split': instance.split,
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersColorSettingEntityImpl
    _$$DeviceCapabilityParametersColorSettingEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersColorSettingEntityImpl(
          colorModel: $enumDecodeNullable(
              _$DeviceColorModelEnumMap, json['color_model']),
          temperatureK: _$recordConvertNullable(
            json['temperature_k'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num?)?.toInt(),
              min: ($jsonValue['min'] as num?)?.toInt(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersColorSettingEntityImplToJson(
        _$DeviceCapabilityParametersColorSettingEntityImpl instance) =>
    <String, dynamic>{
      'color_model': _$DeviceColorModelEnumMap[instance.colorModel],
      'temperature_k': instance.temperatureK == null
          ? null
          : <String, dynamic>{
              'max': instance.temperatureK!.max,
              'min': instance.temperatureK!.min,
            },
      'instance': instance.$type,
    };

const _$DeviceColorModelEnumMap = {
  DeviceColorModel.hsv: 'hsv',
  DeviceColorModel.rgb: 'rgb',
};

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

_$DeviceCapabilityParametersWorkSpeedEntityImpl
    _$$DeviceCapabilityParametersWorkSpeedEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersWorkSpeedEntityImpl(
          modes: (json['modes'] as List<dynamic>)
              .map((e) => _$recordConvert(
                    e,
                    ($jsonValue) => (value: $jsonValue['value'] as String,),
                  ))
              .toList(),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersWorkSpeedEntityImplToJson(
        _$DeviceCapabilityParametersWorkSpeedEntityImpl instance) =>
    <String, dynamic>{
      'modes': instance.modes
          .map((e) => <String, dynamic>{
                'value': e.value,
              })
          .toList(),
      'instance': instance.$type,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

_$DeviceCapabilityParametersBrightnessEntityImpl
    _$$DeviceCapabilityParametersBrightnessEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersBrightnessEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersBrightnessEntityImplToJson(
        _$DeviceCapabilityParametersBrightnessEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersChannelEntityImpl
    _$$DeviceCapabilityParametersChannelEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersChannelEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersChannelEntityImplToJson(
        _$DeviceCapabilityParametersChannelEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersHumidityEntityImpl
    _$$DeviceCapabilityParametersHumidityEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersHumidityEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersHumidityEntityImplToJson(
        _$DeviceCapabilityParametersHumidityEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersOpenEntityImpl
    _$$DeviceCapabilityParametersOpenEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersOpenEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersOpenEntityImplToJson(
        _$DeviceCapabilityParametersOpenEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersTemperatureEntityImpl
    _$$DeviceCapabilityParametersTemperatureEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersTemperatureEntityImpl(
          randomAccess: json['random_access'] as bool?,
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersTemperatureEntityImplToJson(
        _$DeviceCapabilityParametersTemperatureEntityImpl instance) =>
    <String, dynamic>{
      'random_access': instance.randomAccess,
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersVolumeEntityImpl
    _$$DeviceCapabilityParametersVolumeEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersVolumeEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersVolumeEntityImplToJson(
        _$DeviceCapabilityParametersVolumeEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersBatteryLevelEntityImpl
    _$$DeviceCapabilityParametersBatteryLevelEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersBatteryLevelEntityImpl(
          unit: _deviceUnitFromJson(json['unit']),
          range: _$recordConvertNullable(
            json['range'],
            ($jsonValue) => (
              max: ($jsonValue['max'] as num).toDouble(),
              min: ($jsonValue['min'] as num).toDouble(),
              precision: ($jsonValue['precision'] as num?)?.toDouble(),
            ),
          ),
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersBatteryLevelEntityImplToJson(
        _$DeviceCapabilityParametersBatteryLevelEntityImpl instance) =>
    <String, dynamic>{
      'unit': _deviceUnitToJson(instance.unit),
      'range': instance.range == null
          ? null
          : <String, dynamic>{
              'max': instance.range!.max,
              'min': instance.range!.min,
              'precision': instance.range!.precision,
            },
      'instance': instance.$type,
    };

_$DeviceCapabilityParametersUnknownEntityImpl
    _$$DeviceCapabilityParametersUnknownEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DeviceCapabilityParametersUnknownEntityImpl(
          $type: json['instance'] as String?,
        );

Map<String, dynamic> _$$DeviceCapabilityParametersUnknownEntityImplToJson(
        _$DeviceCapabilityParametersUnknownEntityImpl instance) =>
    <String, dynamic>{
      'instance': instance.$type,
    };
