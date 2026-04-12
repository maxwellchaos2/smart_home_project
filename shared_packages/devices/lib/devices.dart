library;

import 'package:common/common.dart';
import 'package:devices/src/di/di.dart';

export 'package:devices_entities/devices_entities.dart';

export 'src/domain/domain.dart'
    show
        DevicesBloc,
        DevicesEvent,
        IDevicesRepository,
        IDevicesController,
        ICreateDeviceController,
        IDeleteDeviceController,
        IUpdateDeviceController,
        DevicesState;

abstract final class DevicesModule {
  static Future<void> init({required GetIt locator}) async {
    await DevicesDI.init(locator: locator);
  }
}
