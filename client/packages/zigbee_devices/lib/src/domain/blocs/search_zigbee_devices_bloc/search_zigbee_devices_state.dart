part of 'search_zigbee_devices_bloc.dart';

@freezed
sealed class SearchZigbeeDevicesState with _$SearchZigbeeDevicesState {
  const SearchZigbeeDevicesState._();
  const factory SearchZigbeeDevicesState.loading({ZigbeeDeviceEntity? data}) =
      _Loading;
  const factory SearchZigbeeDevicesState.timeout({ZigbeeDeviceEntity? data}) =
      _Timeout;
  const factory SearchZigbeeDevicesState.success(
      {required ZigbeeDeviceEntity data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}
