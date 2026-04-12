import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';

abstract interface class IDevicesRepository {
  Future<List<DeviceEntity>> fetchAll({
    required int projectId,
  });

  Future<void> updateDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  });

  Future<void> updateDevicesProperties({
    required List<UpdateDevicesPropertiesInput> inputs,
  });

  Future<DeviceEntity> createDevice({
    required DeviceInputEntity input,
    required int projectId,
  });

  Future<void> deleteDevice({
    required int id,
    required int projectId,
  });

  Future<DeviceEntity> updateDevice({
    required int id,
    required DeviceInputEntity input,
    required int projectId,
  });

  Stream<List<ChangedEvent<DeviceEntity>>> get onChanged;

  void dispose();
}

typedef UpdateDevicesCapabilitiesInput = ({
  DeviceEntity device,
  List<DeviceCapabilityEntity> input,
});

typedef UpdateDevicesPropertiesInput = ({
  DeviceEntity device,
  List<DevicePropertyEntity> input,
});
