import 'package:app_info/src/domain/domain.dart';
import 'package:device_info_plus/device_info_plus.dart';

abstract final class DeviceInfoMapper {
  static DeviceInfoEntity toEntity({required BaseDeviceInfo from}) {
    return switch (from) {
      AndroidDeviceInfo from => DeviceInfoEntity(
          name: from.model, // POCO F2 Pro
          family: from.brand, // POCO
          systemVersion: from.version.release, // 12
          systemName: 'Android',
        ),
      IosDeviceInfo from => DeviceInfoEntity(
          name: from.name, // iPhone 14 Pro
          family: from.model, // iPhone
          systemVersion: from.systemVersion, // 16.2
          systemName: from.systemName, // iOS
        ),
      MacOsDeviceInfo from => DeviceInfoEntity(
          name: from.model, // MacBook Pro
          family: from.model, // MacBook
          systemVersion: from.osRelease, // 12.1
          systemName: 'macOS',
        ),
      LinuxDeviceInfo from => DeviceInfoEntity(
          name: from.prettyName, // MacBook Pro
          family: from.version, // MacBook
          systemVersion: from.versionId, // 12.1
          systemName: 'Linux',
        ),
      _ => throw UnimplementedError(),
    };
  }
}
