import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:web_socket_core/web_socket_core.dart';

final class DevicesRepositoryImpl implements IDevicesRepository {
  const DevicesRepositoryImpl({
    required IDeviceDatabaseDatasource databaseSource,
    required IWebSocketRepository webSocketRepository,
  })  : _databaseSource = databaseSource,
        _webSocketRepository = webSocketRepository;

  final IDeviceDatabaseDatasource _databaseSource;
  final IWebSocketRepository _webSocketRepository;

  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  Future<List<DeviceEntity>> fetchAll({int? projectId, List<int>? ids}) async {
    return await _databaseSource.fetchAll(projectId: projectId, ids: ids);
  }

  Future<DeviceEntity> fetch({required int id}) async {
    return await _databaseSource.fetch(id: id);
  }

  Future<DeviceEntity> fetchByProvider({
    required DeviceProviderType providerType,
    required String providerDeviceId,
  }) async {
    return await _databaseSource.fetchByProvider(
      providerType: providerType,
      providerDeviceId: providerDeviceId,
    );
  }

  Future<DeviceEntity> createDevice({required DeviceInputEntity input}) async {
    return await _databaseSource.createDevice(input: input);
  }

  Future<DeviceEntity> updateDevice({
    required int deviceId,
    required DeviceInputEntity input,
  }) async {
    return await _databaseSource.updateDevice(
      deviceId: deviceId,
      input: input,
    );
  }

  Future<void> deleteDevice({required int id}) async {
    return await _databaseSource.deleteDevice(id: id);
  }

  Future<DeviceEntity> updateDeviceState({
    required int deviceId,
    List<DeviceCapabilityEntity>? capabilities,
    List<DevicePropertyEntity>? properties,
  }) async {
    final device = await _databaseSource.updateDeviceState(
      deviceId: deviceId,
      capabilities: capabilities,
      properties: properties,
    );

    _webSocketRepository.sendMessage(
      [
        {
          'type': 'deviceStateChanged',
          'deviceId': device.id,
          if (capabilities != null)
            'deviceCapabilities': capabilities
                .map(
                  (capability) => capability.toJson(),
                )
                .toList(),
          if (properties != null)
            'deviceProperties': properties
                .map(
                  (property) => property.toJson(),
                )
                .toList(),
        },
      ],
      topic: 'project-${device.projectId}',
    );
    return device;
  }

  Future<DeviceEntity?> fetchByInputId({
    required int inputId,
    required int projectId,
  }) {
    return _databaseSource.fetchByInputId(
      inputId: inputId,
      projectId: projectId,
    );
  }

  Future<DeviceEntity?> fetchByOutputId({
    required int outputId,
    required int projectId,
  }) {
    return _databaseSource.fetchByOutputId(
      outputId: outputId,
      projectId: projectId,
    );
  }

  Future<void> deleteAllByProviderType({
    required DeviceProviderType providerType,
  }) async {
    return await _databaseSource.deleteAllByProviderType(
      providerType: providerType,
    );
  }

  Future<DeviceEntity> onDeviceHeartbeat({
    required int deviceId,
  }) async {
    return await _databaseSource.onDeviceHeartbeat(
      deviceId: deviceId,
    );
  }

  Future<List<DeviceEntity>> updateOfflineDevices() async {
    return await _databaseSource.updateOfflineDevices();
  }
}
