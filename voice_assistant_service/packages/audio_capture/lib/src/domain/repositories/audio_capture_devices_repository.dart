import 'package:audio_capture/src/domain/domain.dart';

abstract interface class IAudioCaptureDevicesRepository {
  Future<List<AudioCaptureDeviceEntity>> fetchAvailableDevices();
}
