part of 'audio_capture_devices_bloc.dart';

@freezed
class AudioCaptureDevicesEvent with _$AudioCaptureDevicesEvent {
  const factory AudioCaptureDevicesEvent.fetch() = _Fetch;
}