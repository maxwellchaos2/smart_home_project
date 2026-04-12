library;

import 'package:audio_capture/src/di/di.dart';
import 'package:common/common.dart';

export 'src/data/data.dart'
    show AudioCaptureDeviceMapper, VoiceRecorder, ChunkedVoiceRecorder;
export 'src/domain/domain.dart'
    show
        AudioCaptureDeviceEntity,
        IAudioCaptureDevicesRepository,
        IAudioCaptureDevicesController;

abstract final class AudioCaptureModule {
  static Future<void> init({required GetIt locator}) async {
    await AudioCaptureDI.init(locator: locator);
  }
}
