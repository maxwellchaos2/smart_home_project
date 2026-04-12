library;

import 'package:common/common.dart';
import 'package:zigbee_devices/src/di/di.dart';

export 'src/application/application.dart' show AddZigbeeDevicesScreen;
export 'src/data/data.dart' show ZigbeeDeviceMapper, ZigbeeDeviceModel;
export 'src/domain/domain.dart'
    show ZigbeeDeviceEntity, $ZigbeeDeviceEntityCopyWith;

abstract final class ZigbeeDevicesModule {
  static Future<void> init({required GetIt locator}) async {
    await ZigbeeDevicesDI.init(locator: locator);
  }
}
