import 'package:device_info_plus/device_info_plus.dart';

abstract interface class IDeviceInfoPlusClient {
  Future<BaseDeviceInfo> fetch();
}

final class DeviceInfoPlusClientImpl implements IDeviceInfoPlusClient {
  const DeviceInfoPlusClientImpl({required DeviceInfoPlugin plugin})
      : _plugin = plugin;

  final DeviceInfoPlugin _plugin;

  @override
  Future<BaseDeviceInfo> fetch() {
    return _plugin.deviceInfo;
  }
}
