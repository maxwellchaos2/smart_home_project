part of 'search_zigbee_devices_bloc.dart';

@freezed
class SearchZigbeeDevicesEvent with _$SearchZigbeeDevicesEvent {
  @visibleForTesting
  const factory SearchZigbeeDevicesEvent.$found({
    required ZigbeeDeviceEntity device,
  }) = _Found;

  const factory SearchZigbeeDevicesEvent.startSearchZigbeeDevices() =
      _StartSearchZigbeeDevices;

  @visibleForTesting
  const factory SearchZigbeeDevicesEvent.$timeout() = _TimeoutEvent;
}
