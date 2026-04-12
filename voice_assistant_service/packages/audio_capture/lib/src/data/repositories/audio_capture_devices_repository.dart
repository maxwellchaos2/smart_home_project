import 'package:audio_capture/src/data/data.dart';
import 'package:audio_capture/src/domain/domain.dart';

final class AudioCaptureDevicesRepositoryImpl
    implements IAudioCaptureDevicesRepository {
  const AudioCaptureDevicesRepositoryImpl({
    required IAudioCaptureDeviceDetectorClient deviceDetectorClient,
  }) : _deviceDetectorClient = deviceDetectorClient;

  final IAudioCaptureDeviceDetectorClient _deviceDetectorClient;

  @override
  Future<List<AudioCaptureDeviceEntity>> fetchAvailableDevices() {
    return _deviceDetectorClient.getAvailableDevices();
  }
}
