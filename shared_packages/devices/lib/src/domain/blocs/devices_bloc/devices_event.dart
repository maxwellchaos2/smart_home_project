part of 'devices_bloc.dart';

@freezed
class DevicesEvent with _$DevicesEvent {
  const factory DevicesEvent.fetch() = _Fetch;

  const factory DevicesEvent.needChangeDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) = _NeedChangeDevicesCapabilities;

  const factory DevicesEvent.devicesCapabilitiesChanged({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) = _DevicesCapabilitiesChanged;

  const factory DevicesEvent.devicesPropertiesChanged({
    required List<UpdateDevicesPropertiesInput> inputs,
  }) = _DevicesPropertiesChanged;

  @visibleForTesting
  const factory DevicesEvent.$changed({
    required List<ChangedEvent<DeviceEntity>> events,
  }) = _Changed;
}
