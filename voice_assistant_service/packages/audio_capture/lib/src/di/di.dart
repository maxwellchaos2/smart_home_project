import 'package:audio_capture/src/data/data.dart';
import 'package:audio_capture/src/domain/domain.dart';
import 'package:common/common.dart';

abstract final class AudioCaptureDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IAudioCaptureDevicesRepository getRepo({required GetIt locator}) {
    return AudioCaptureDevicesRepositoryImpl(
      deviceDetectorClient: AudioCaptureDeviceDetectorClientImpl(),
    );
  }
}
