part of 'devices_bloc.dart';

@freezed
class DevicesEvent with _$DevicesEvent {
  const factory DevicesEvent.fetch() = _Fetch;

  const factory DevicesEvent.updateDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) = _UpdateDevicesCapabilities;

  const factory DevicesEvent.updateDevicesProperties({
    required List<UpdateDevicesPropertiesInput> inputs,
  }) = _UpdateDevicesProperties;

  @visibleForTesting
  const factory DevicesEvent.$changed({
    required List<ChangedEvent<DeviceEntity>> events,
  }) = _Changed;
}
