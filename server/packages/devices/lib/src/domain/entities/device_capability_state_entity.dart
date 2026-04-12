import 'package:common/common.dart';

part 'device_capability_state_entity.freezed.dart';
part 'device_capability_state_entity.g.dart';

@Freezed(
  fromJson: true,
  toJson: true,
  copyWith: true,
  equal: true,
  unionKey: 'instance',
  fallbackUnion: 'unknown',
)
sealed class DeviceCapabilityStateEntity with _$DeviceCapabilityStateEntity {
  const DeviceCapabilityStateEntity._();

  const factory DeviceCapabilityStateEntity.on({
    required bool? value,
  }) = DeviceCapabilityStateOnEntity;

  const factory DeviceCapabilityStateEntity.rgb({
    required int value,
  }) = DeviceCapabilityStateRgbEntity;

  const factory DeviceCapabilityStateEntity.hsv({
    required HSVColor value,
  }) = DeviceCapabilityStateHsvEntity;

  const factory DeviceCapabilityStateEntity.temperatureK({
    required int value,
  }) = DeviceCapabilityStateTemperatureKEntity;

  const factory DeviceCapabilityStateEntity.scene({
    required String value,
  }) = DeviceCapabilityStateSceneEntity;

  const factory DeviceCapabilityStateEntity.temperature({
    required double value,
  }) = DeviceCapabilityStateTemperatureEntity;

  const factory DeviceCapabilityStateEntity.humidity({
    required double value,
  }) = DeviceCapabilityStateHumidityEntity;

  const factory DeviceCapabilityStateEntity.workSpeed({
    required String value,
  }) = DeviceCapabilityStateWorkSpeedEntity;

  // // Range
  const factory DeviceCapabilityStateEntity.brightness({
    required double value,
  }) = DeviceCapabilityStateBrightnessEntity;

  const factory DeviceCapabilityStateEntity.channel({
    required double value,
  }) = DeviceCapabilityStateChannelEntity;

  const factory DeviceCapabilityStateEntity.volume({
    required double value,
  }) = DeviceCapabilityStateVolumeEntity;

  const factory DeviceCapabilityStateEntity.open({
    required double value,
  }) = DeviceCapabilityStateOpenEntity;

  const factory DeviceCapabilityStateEntity.batteryLevel({
    required double value,
  }) = DeviceCapabilityStateBatteryLevelEntity;

  const factory DeviceCapabilityStateEntity.unknown() =
      DeviceCapabilityStateUnknownEntity;

  // // Toggle
  // const factory DeviceCapabilityStateEntity.backlight({
  //   required bool value,
  // }) = DeviceCapabilityStateBacklightEntity;

  factory DeviceCapabilityStateEntity.fromJson(Map<String, Object?> json) =>
      _$DeviceCapabilityStateEntityFromJson(json);

  @override
  Map<String, Object?> toJson();
}

typedef HSVColor = ({int h, int s, int v});
