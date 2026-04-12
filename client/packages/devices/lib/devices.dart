library;

import 'package:common/common.dart';
import 'package:devices/src/di/di.dart';

export 'src/application/application.dart'
    show
        MainScreen,
        DevicesScope,
        DevicesBlocListener,
        DevicesBlocBuilder,
        DeviceOnFloorLayout,
        ControllerDevicesScreen,
        ControllerDeviceEditScreen,
        CreateDeviceScope,
        CreateDeviceBlocListener,
        DeleteDeviceScope,
        DeleteDeviceBlocListener,
        RoomsTabController,
        RoomsTabBar,
        getIconsByDeviceType,
        unitToString,
        AppSlider,
        DeviceEditScreen,
        DeviceModalSheet;
export 'src/data/data.dart' show DeviceResponseModel, DeviceResponseMapper;
export 'src/domain/domain.dart'
    show
        DeviceEntity,
        $DeviceEntityCopyWith,
        DeviceCapabilityEntity,
        DeviceCapabilityStateOnEntity,
        DeviceCapabilityStateEntity,
        $DeviceCapabilityStateEntityCopyWith,
        DeviceInputEntity,
        DeviceProviderType,
        DeviceType,
        DevicePropertyEntity,
        ListDeviceCapabilityEntityEx,
        DeviceTypeMapper,
        DevicePropertyEventEntity,
        DevicePropertyFloatEntity,
        ListDevicePropertyEntityEx;
export 'src/domain/entities/device_capability_parameters_entity.dart';
export 'src/domain/entities/device_capability_state_entity.dart';

abstract final class DevicesModule {
  static Future<void> init({required GetIt locator}) async {
    await DevicesDI.init(locator: locator);
  }
}
