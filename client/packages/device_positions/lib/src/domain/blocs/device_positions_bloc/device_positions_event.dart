part of 'device_positions_bloc.dart';

@freezed
class DevicePositionsEvent with _$DevicePositionsEvent {
  const factory DevicePositionsEvent.fetchAll() = _FetchAll;
}
