import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:projects/projects.dart';
import 'package:yandex_dialogs/src/domain/domain.dart';

Future<void> updateYandexDevicesStatusHandler(GetIt locator,
    {required List<DeviceEntity> changedDevices}) async {
  final yandexDialogsRepository = locator.get<IYandexDialogsRepository>();
  final projectsRepository = locator.get<IProjectsRepository>();

  // seconds
  final timestamp = DateTime.now().millisecondsSinceEpoch / 1000.0;

  if (changedDevices.isEmpty) {
    return;
  }

  final projectsMap = <int, ProjectEntity>{};

  for (final device in changedDevices) {
    if (!projectsMap.containsKey(device.projectId)) {
      final project = await projectsRepository.fetch(id: device.projectId);
      projectsMap[device.projectId] = project;
    }
  }

  final userIdDevicesMap = <String, List<DeviceEntity>>{};

  for (final device in changedDevices) {
    final project = projectsMap[device.projectId]!;
    final userId = project.userId.toString();

    userIdDevicesMap.putIfAbsent(userId, () => []);
    userIdDevicesMap[userId]!.add(device);
  }

  for (final entry in userIdDevicesMap.entries) {
    final userId = entry.key;
    final devices = entry.value;

    final payload = YandexDevicesStatesPayloadInputEntity(
      userId: userId,
      devices: devices
          .map(
            (device) => YandexDeviceStateInputEntity(
              id: device.id.toString(),
              status: switch (device.status) {
                DeviceStatus.offline => YandexDeviceStateStatus.offline,
                DeviceStatus.online => YandexDeviceStateStatus.online,
              },
            ),
          )
          .toList(),
    );
    try {
      await yandexDialogsRepository.devicesStateChanged(
        timestamp: timestamp,
        payload: payload,
      );
    } catch (e) {
      //ignore errors
      print('Failed to update Yandex devices status for user $userId: $e');
    }
  }
}
