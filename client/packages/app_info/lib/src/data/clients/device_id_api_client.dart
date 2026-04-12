import 'package:android_id/android_id.dart';

abstract interface class IDeviceIdApiClient {
  Future<String> getDeviceId();
}

final class DeviceIdApiClientImpl implements IDeviceIdApiClient {
  final AndroidId _androidId;

  DeviceIdApiClientImpl({required AndroidId androidId})
      : _androidId = androidId;

  @override
  Future<String> getDeviceId() async {
    return await _androidId.getId() ?? '';
  }
}
