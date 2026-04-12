import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';

part 'device_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class DeviceEntity with _$DeviceEntity {
  const DeviceEntity._();

  const factory DeviceEntity({
    required int id,
    required DeviceProviderType providerType,
    required String? providerDeviceId,
    required DeviceType type,
    required int? inputId,
    required int? outputId,
    required String name,
    required bool isHidden,
    required List<DeviceCapabilityEntity> capabilities,
    required List<DevicePropertyEntity> properties,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int? roomId,
    required int? floorId,
    required int projectId,
    required Map<String, Object?>? customData,
    required DateTime lastHeartbeat,
    required DeviceStatus status,
  }) = _DeviceEntity;
}

enum DeviceStatus {
  online,
  offline,
}

enum DeviceType {
  sensor,
  sensorButton,
  sensorClimate,
  sensorGas,
  sensorIllumination,
  sensorMotion,
  sensorOpen,
  sensorSmoke,
  sensorVibration,
  sensorWaterLeak,
  //
  smartMeter,
  smartMeterColdWater,
  smartMeterElectricity,
  smartMeterGas,
  smartMeterHeat,
  smartMeterHotWater,
  //
  camera,
  mediaDevice,
  mediaDeviceReceiver,
  mediaDeviceTV,
  mediaDeviceTVBox,
  //
  cooking,
  cookingCoffeeMaker,
  cookingKettle,
  cookingMulticooker,
  dishwasher,
  //
  iron,
  vacuumCleaner,
  washingMachine,
  //
  petDrinkingFountain,
  petFeeder,
  //
  humidifier,
  purifier,
  thermostat,
  thermostatAc,
  ventilation,
  ventilationFan,
  //
  light,
  lightLamp,
  lightCeiling,
  lightStrip,
  socket,
  switch_,
  switchRelay,
  //
  openable,
  openableCurtain,
  openableValve,

  doorWithLock,
  microphone,
  smartHub,
  controlBoxHub,
  cameraHub,
  //
  other,
}

enum DeviceProviderType {
  logoSiemens,
  yandex,
  zigbee,
  hardware,
  hikvision,
  wifi,
  unknown,
}
