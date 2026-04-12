import 'package:common/common.dart';

part 'device_capability_parameters_entity.freezed.dart';
part 'device_capability_parameters_entity.g.dart';

@Freezed(
  fromJson: true,
  toJson: true,
  copyWith: true,
  equal: true,
  unionKey: 'instance',
  fallbackUnion: 'unknown',
)
sealed class DeviceCapabilityParametersEntity
    with _$DeviceCapabilityParametersEntity {
  const DeviceCapabilityParametersEntity._();

  const factory DeviceCapabilityParametersEntity.onOff({
    required bool? split,
  }) = DeviceCapabilityParametersOnOffEntity;

  const factory DeviceCapabilityParametersEntity.colorSetting({
    required DeviceColorModel? colorModel,
    required DeviceTemperatureKEntity? temperatureK,
    required DeviceColorScene? colorScene,
  }) = DeviceCapabilityParametersColorSettingEntity;

  const factory DeviceCapabilityParametersEntity.workSpeed({
    required List<DeviceWorkTypeEntity> modes,
  }) = DeviceCapabilityParametersWorkSpeedEntity;

  const factory DeviceCapabilityParametersEntity.brightness({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersBrightnessEntity;

  const factory DeviceCapabilityParametersEntity.channel({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersChannelEntity;

  const factory DeviceCapabilityParametersEntity.humidity({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
  }) = DeviceCapabilityParametersHumidityEntity;

  const factory DeviceCapabilityParametersEntity.open({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersOpenEntity;

  const factory DeviceCapabilityParametersEntity.temperature({
    required bool? randomAccess,
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersTemperatureEntity;

  const factory DeviceCapabilityParametersEntity.volume({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersVolumeEntity;

  const factory DeviceCapabilityParametersEntity.batteryLevel({
    @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
    required DeviceUnit? unit,
    required DeviceRangeEntity? range,
  }) = DeviceCapabilityParametersBatteryLevelEntity;

  const factory DeviceCapabilityParametersEntity.unknown() =
      DeviceCapabilityParametersUnknownEntity;

  factory DeviceCapabilityParametersEntity.fromJson(
          Map<String, Object?> json) =>
      _$DeviceCapabilityParametersEntityFromJson(json);

  @override
  Map<String, Object?> toJson();
}

DeviceUnit? _deviceUnitFromJson(Object? json) {
  if (json is String?) {
    return DeviceUnit.values
        .firstWhereOrNull((e) => ('unit.${e.name}') == json);
  }
  throw ArgumentError.value(json, 'json', 'Cannot convert to DeviceUnit');
}

String? _deviceUnitToJson(DeviceUnit? deviceUnit) {
  if (deviceUnit == null) {
    return null;
  }
  return 'unit.${deviceUnit.name}';
}

enum DeviceColorModel {
  hsv,
  rgb,
}

enum DeviceUnit {
  celsius,
  fahrenheit,
  percent,
}

typedef DeviceTemperatureKEntity = ({
  int? min,
  int? max,
});

typedef DeviceRangeEntity = ({
  double min,
  double max,
  double? precision,
});

typedef DeviceWorkTypeEntity = ({
  String value,
});

typedef DeviceColorScene = ({
  List<DeviceColorSceneItem> scenes,
});

typedef DeviceColorSceneItem = ({
  String id,
});
