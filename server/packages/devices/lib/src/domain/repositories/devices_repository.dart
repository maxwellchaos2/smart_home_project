import 'package:devices/src/domain/domain.dart';

abstract interface class IDevicesRepository {
  Future<bool> createTableIfNotExists();

  Future<List<DeviceEntity>> fetchAll({int? projectId, List<int>? ids});

  Future<DeviceEntity> fetch({required int id});

  Future<DeviceEntity> fetchByProvider({
    required DeviceProviderType providerType,
    required String providerDeviceId,
  });

  Future<DeviceEntity?> fetchByInputId({
    required int inputId,
    required int projectId,
  });
  Future<DeviceEntity?> fetchByOutputId({
    required int outputId,
    required int projectId,
  });

  Future<DeviceEntity> createDevice({required DeviceInputEntity input});

  Future<DeviceEntity> updateDevice({
    required int deviceId,
    required DeviceInputEntity input,
  });

  Future<void> deleteDevice({required int id});

  Future<DeviceEntity> updateDeviceState({
    required int deviceId,
    List<DeviceCapabilityEntity>? capabilities,
    List<DevicePropertyEntity>? properties,
  });

  Future<void> deleteAllByProviderType({
    required DeviceProviderType providerType,
  });

  Future<DeviceEntity> onDeviceHeartbeat({
    required int deviceId,
  });

  Future<List<DeviceEntity>> updateOfflineDevices();
}
