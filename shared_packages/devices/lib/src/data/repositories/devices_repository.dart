import 'dart:async';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

final class DevicesRepositoryImpl implements IDevicesRepository {
  DevicesRepositoryImpl({
    required IDevicesRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource {
    _remoteSource.onChanged.listen((events) {
      _changedController.add(events);
    });
  }

  final IDevicesRemoteDatasource _remoteSource;

  final _changedController =
      StreamController<List<ChangedEvent<DeviceEntity>>>.broadcast();

  @override
  Future<List<DeviceEntity>> fetchAll({
    required int projectId,
  }) async {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<DeviceEntity> createDevice(
      {required DeviceInputEntity input, required int projectId}) async {
    final device =
        await _remoteSource.createDevice(input: input, projectId: projectId);
    _changedController.add([ChangedEvent.created(device)]);
    return device;
  }

  @override
  Future<void> deleteDevice({required int id, required int projectId}) async {
    await _remoteSource.deleteDevice(id: id, projectId: projectId);
    _changedController.add([ChangedEvent.deleted(itemId: id)]);
  }

  @override
  Future<DeviceEntity> updateDevice({
    required int id,
    required DeviceInputEntity input,
    required int projectId,
  }) async {
    final device = await _remoteSource.updateDevice(
        id: id, input: input, projectId: projectId);
    _changedController.add([ChangedEvent.updated(device)]);
    return device;
  }

  @override
  Stream<List<ChangedEvent<DeviceEntity>>> get onChanged =>
      _changedController.stream;

  @override
  void dispose() {
    _changedController.close();
  }

  @override
  Future<void> needChangeDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) async {
    await _remoteSource.needChangeDevicesCapabilities(inputs: inputs);
  }

  @override
  Future<void> devicesCapabilitiesChanged({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) async {
    await _remoteSource.devicesCapabilitiesChanged(inputs: inputs);
  }

  @override
  Future<void> devicesPropertiesChanged({
    required List<UpdateDevicesPropertiesInput> inputs,
  }) async {
    await _remoteSource.devicesPropertiesChanged(inputs: inputs);
  }
}
