import 'package:devices/devices.dart';

abstract final class DeviceProviderTypeMapper {
  static String toModel({required DeviceProviderType from}) {
    return switch (from) {
      DeviceProviderType.logoSiemens => 'logo_siemens',
      DeviceProviderType.yandex => 'yandex',
      DeviceProviderType.zigbee => 'zigbee',
      DeviceProviderType.hardware => 'hardware',
      DeviceProviderType.hikvision => 'hikvision',
      DeviceProviderType.wifi => 'wifi',
      DeviceProviderType.unknown => 'unknown',
    };
  }

  static DeviceProviderType toEntity({required String from}) {
    return switch (from) {
      'logo_siemens' => DeviceProviderType.logoSiemens,
      'yandex' => DeviceProviderType.yandex,
      'zigbee' => DeviceProviderType.zigbee,
      'hardware' => DeviceProviderType.hardware,
      'hikvision' => DeviceProviderType.hikvision,
      'wifi' => DeviceProviderType.wifi,
      _ => DeviceProviderType.unknown,
    };
  }
}
