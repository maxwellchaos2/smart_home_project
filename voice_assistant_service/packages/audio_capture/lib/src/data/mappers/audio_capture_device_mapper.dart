import 'package:audio_capture/src/domain/domain.dart';
import 'package:devices/devices.dart';

abstract final class AudioCaptureDeviceMapper {
  static DeviceInputEntity toDeviceInput(
      {required AudioCaptureDeviceEntity from}) {
    return DeviceInputEntity(
      providerDeviceId: '${from.cardId},${from.deviceId}',
      providerType: DeviceProviderType.hardware,
      type: DeviceType.microphone,
      inputId: null,
      outputId: null,
      name: from.name,
      capabilities: [
        DeviceCapabilityEntity.onOff(
          state: DeviceCapabilityStateEntity.on(value: true),
          parameters: DeviceCapabilityParametersEntity.onOff(split: false),
        ),
      ],
      // TODO: можно добавить доступные EFFECTS
      properties: [],
      roomId: null,
      floorId: null,
    );
  }
}
