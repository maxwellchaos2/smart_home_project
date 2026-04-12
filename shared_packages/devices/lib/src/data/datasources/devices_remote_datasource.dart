import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';

abstract interface class IDevicesRemoteDatasource {
  Future<List<DeviceEntity>> fetchAll({
    required int projectId,
  });

  Future<void> needChangeDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  });

  Future<void> devicesCapabilitiesChanged({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  });

  Future<void> devicesPropertiesChanged({
    required List<UpdateDevicesPropertiesInput> inputs,
  });

  Future<void> deleteDevice({
    required int projectId,
    required int id,
  });

  Future<DeviceEntity> createDevice({
    required int projectId,
    required DeviceInputEntity input,
  });

  Future<DeviceEntity> updateDevice({
    required int projectId,
    required int id,
    required DeviceInputEntity input,
  });

  Stream<List<ChangedEvent<DeviceEntity>>> get onChanged;

  Future<void> updateYandexDevices();
}

final class DevicesRemoteDatasourceImpl implements IDevicesRemoteDatasource {
  const DevicesRemoteDatasourceImpl(
      {required DevicesApiClient client,
      required IEventsRepository eventsRepository})
      : _client = client,
        _eventsRepository = eventsRepository;

  final DevicesApiClient _client;
  final IEventsRepository _eventsRepository;

  @override
  Future<List<DeviceEntity>> fetchAll({
    required int projectId,
  }) async {
    try {
      final devices = await _client.fetchAll(projectId: projectId);
      return devices
          .map((device) => DeviceResponseMapper.toEntity(from: device))
          .toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<void> needChangeDevicesCapabilities({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) async {
    await _eventsRepository.sendMessages(
      messages: [
        for (final input in inputs)
          EventMessageInputEntity.needDeviceCapabilitiesChange(
            deviceId: input.device.id,
            capabilities: input.input,
          ),
      ],
    );
  }

  Future<void> devicesCapabilitiesChanged({
    required List<UpdateDevicesCapabilitiesInput> inputs,
  }) async {
    await _eventsRepository.sendMessages(
      messages: [
        for (final input in inputs)
          EventMessageInputEntity.deviceCapabilitiesChanged(
            deviceId: input.device.id,
            capabilities: input.input,
          ),
      ],
    );
  }

  Future<void> devicesPropertiesChanged({
    required List<UpdateDevicesPropertiesInput> inputs,
  }) async {
    await _eventsRepository.sendMessages(
      messages: [
        for (final input in inputs)
          EventMessageInputEntity.devicePropertiesChanged(
            deviceId: input.device.id,
            properties: input.input,
          ),
      ],
    );
  }

  @override
  Future<void> deleteDevice({
    required int id,
    required int projectId,
  }) async {
    try {
      await _client.deleteDevice(id: id, projectId: projectId);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<DeviceEntity> createDevice({
    required DeviceInputEntity input,
    required int projectId,
  }) async {
    try {
      final device = await _client.createDevice(
        input: DeviceInputMapper.toModel(from: input),
        projectId: projectId,
      );
      return DeviceResponseMapper.toEntity(from: device);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<DeviceEntity> updateDevice({
    required int id,
    required DeviceInputEntity input,
    required int projectId,
  }) async {
    try {
      final device = await _client.updateDevice(
        id: id,
        input: DeviceInputMapper.toModel(from: input),
        projectId: projectId,
      );
      return DeviceResponseMapper.toEntity(from: device);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Stream<List<ChangedEvent<DeviceEntity>>> get onChanged =>
      _eventsRepository.onEvents.map(
        (events) => events
            .where(
          (event) => event.maybeMap(
              orElse: () => false,
              deviceCreated: (_) => true,
              deviceUpdated: (_) => true,
              deviceDeleted: (_) => true),
        )
            .map(
          (event) {
            return event.mapOrNull(
              deviceCreated: (event) => ChangedEvent.created(event.device),
              deviceUpdated: (event) => ChangedEvent.updated(event.device),
              deviceDeleted: (event) => ChangedEvent.deleted(
                  itemId: event.device.id, item: event.device),
            )!;
          },
        ).toList(),
      );

  @override
  Future<void> updateYandexDevices() async {
    try {
      await _client.updateYandexDevices();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}
