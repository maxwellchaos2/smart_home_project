import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

abstract interface class IDeviceDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DeviceEntity>> fetchAll({int? projectId, List<int>? ids});

  Future<DeviceEntity> fetch({required int id});

  Future<DeviceEntity> fetchByProvider({
    required DeviceProviderType providerType,
    required String providerDeviceId,
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

  Future<DeviceEntity?> fetchByInputId({
    required int inputId,
    required int projectId,
  });
  Future<DeviceEntity?> fetchByOutputId({
    required int outputId,
    required int projectId,
  });

  Future<void> deleteAllByProviderType(
      {required DeviceProviderType providerType});

  Future<DeviceEntity> onDeviceHeartbeat({
    required int deviceId,
  });

  Future<List<DeviceEntity>> updateOfflineDevices();
}

final class DeviceDatabaseDatasourceImpl implements IDeviceDatabaseDatasource {
  const DeviceDatabaseDatasourceImpl({required IDevicesDatabaseClient client})
      : _client = client;

  final IDevicesDatabaseClient _client;

  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  Future<bool> createTable() async {
    return await _client.createTable();
  }

  Future<List<DeviceEntity>> fetchAll({int? projectId, List<int>? ids}) async {
    final devices = await _client.fetchAll(projectId: projectId, ids: ids);
    return devices
        .map((device) => DeviceMapper.toEntity(from: device))
        .toList();
  }

  Future<DeviceEntity> fetch({required int id}) async {
    final device = await _client.fetch(id: id);
    return DeviceMapper.toEntity(from: device);
  }

  Future<DeviceEntity> fetchByProvider({
    required DeviceProviderType providerType,
    required String providerDeviceId,
  }) async {
    final device = await _client.fetchByProvider(
      providerType: DeviceProviderTypeMapper.toModel(from: providerType),
      providerDeviceId: providerDeviceId,
    );
    return DeviceMapper.toEntity(from: device);
  }

  Future<DeviceEntity> createDevice({required DeviceInputEntity input}) async {
    final device = await _client.createDevice(
      input: DeviceInputMapper.toModel(from: input),
    );
    return DeviceMapper.toEntity(from: device);
  }

  Future<DeviceEntity> updateDevice({
    required int deviceId,
    required DeviceInputEntity input,
  }) async {
    final device = await _client.updateDevice(
      deviceId: deviceId,
      input: DeviceInputMapper.toModel(from: input),
    );
    return DeviceMapper.toEntity(from: device);
  }

  Future<void> deleteDevice({required int id}) async {
    await _client.deleteDevice(id: id);
  }

  Future<DeviceEntity> updateDeviceState({
    required int deviceId,
    List<DeviceCapabilityEntity>? capabilities,
    List<DevicePropertyEntity>? properties,
  }) async {
    final device = await _client.updateDeviceState(
      deviceId: deviceId,
      capabilities:
          capabilities?.map((capability) => capability.toJson()).toList(),
      properties: properties?.map((property) => property.toJson()).toList(),
    );
    return DeviceMapper.toEntity(from: device);
  }

  Future<DeviceEntity?> fetchByInputId({
    required int inputId,
    required int projectId,
  }) async {
    final device = await _client.fetchByInputId(
      inputId: inputId,
      projectId: projectId,
    );
    return switch (device) {
      DeviceModel device => DeviceMapper.toEntity(from: device),
      null => null,
    };
  }

  Future<DeviceEntity?> fetchByOutputId({
    required int outputId,
    required int projectId,
  }) async {
    final device = await _client.fetchByOutputId(
      outputId: outputId,
      projectId: projectId,
    );
    return switch (device) {
      DeviceModel device => DeviceMapper.toEntity(from: device),
      null => null,
    };
  }

  Future<void> deleteAllByProviderType({
    required DeviceProviderType providerType,
  }) async {
    return _client.deleteAllByProviderType(
      providerType: DeviceProviderTypeMapper.toModel(from: providerType),
    );
  }

  Future<DeviceEntity> onDeviceHeartbeat({
    required int deviceId,
  }) async {
    final device = await _client.onDeviceHeartbeat(
      deviceId: deviceId,
    );
    return DeviceMapper.toEntity(from: device);
  }

  Future<List<DeviceEntity>> updateOfflineDevices() async {
    final devices = await _client.updateOfflineDevices();
    return devices
        .map((device) => DeviceMapper.toEntity(from: device))
        .toList();
  }
}
