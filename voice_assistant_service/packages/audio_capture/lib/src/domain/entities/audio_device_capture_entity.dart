import 'package:common/common.dart';

part 'audio_device_capture_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class AudioCaptureDeviceEntity with _$AudioCaptureDeviceEntity {
  const AudioCaptureDeviceEntity._();

  const factory AudioCaptureDeviceEntity({
    required String cardId,
    required String deviceId,
    required String name,
    required String description,
  }) = _AudioCaptureDeviceEntity;
}
