import 'package:zigbee_devices/zigbee_devices.dart';

abstract interface class IZigbeeDevicesRepository {
  Future<void> startSearchZigbeeDevices({
    required int projectId,
  });

  Future<void> stopSearchZigbeeDevices({
    required int projectId,
  });

  Stream<ZigbeeDeviceEntity> get onZigbeeDeviceFound;
}
