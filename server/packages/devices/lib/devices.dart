library;

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/application/application.dart'
    show DeviceResponseModel, DeviceResponseMapper, UpdateOfflineDevicesService;
export 'src/data/data.dart'
    show DeviceModel, DeviceMapper, DeviceProviderTypeMapper;
export 'src/domain/domain.dart'
    show
        IDevicesRepository,
        DeviceEntity,
        $DeviceEntityCopyWith,
        UpdateDeviceFieldsInputEntity,
        DeviceCapabilityEntity,
        $DeviceCapabilityStateEntityCopyWith,
        DeviceCapabilityStateEntity,
        DeviceType,
        DeviceProviderType,
        DeviceInputEntity,
        DevicePropertyEntity,
        ListDevicePropertyEntityEx,
        ListDeviceCapabilityEntityEx,
        DeviceCapabilityStateOnEntity,
        DeviceStatus;

abstract final class DevicesModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await DevicesDI.init(
      locator: locator,
    );
  }
}
