part of 'audio_capture_devices_bloc.dart';

@freezed
sealed class AudioCaptureDevicesState with _$AudioCaptureDevicesState {
  const AudioCaptureDevicesState._();
  const factory AudioCaptureDevicesState.initial(
      {List<AudioCaptureDeviceEntity>? data}) = _Initial;
  const factory AudioCaptureDevicesState.loading(
      {List<AudioCaptureDeviceEntity>? data}) = _Loading;
  const factory AudioCaptureDevicesState.failure(
      {List<AudioCaptureDeviceEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory AudioCaptureDevicesState.success(
      {required List<AudioCaptureDeviceEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}
