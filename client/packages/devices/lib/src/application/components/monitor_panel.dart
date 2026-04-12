import 'package:common/common.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rooms/rooms.dart';

bool deviceFilterBySelectedType(
    DeviceEntity device, SelectDeviceType? selectedType) {
  if (selectedType == null) return !device.isHidden;
  if (selectedType == SelectDeviceType.scenarios) return false;
  if (selectedType == SelectDeviceType.hidden) {
    return device.isHidden == true;
  }
  return DeviceSelectTypeMapper.toDeviceTypes(from: selectedType)
          .contains(device.type) &&
      !device.isHidden;
}

abstract final class DeviceSelectTypeMapper {
  static List<DeviceType> toDeviceTypes({required SelectDeviceType from}) {
    return switch (from) {
      SelectDeviceType.light => [
          DeviceType.light,
          DeviceType.lightLamp,
          DeviceType.lightLamp,
          DeviceType.lightCeiling,
        ],
      SelectDeviceType.door => [
          DeviceType.doorWithLock,
        ],
      SelectDeviceType.sensor => [
          DeviceType.sensorClimate,
          // DeviceType.sensorButton,
          DeviceType.sensor,
          DeviceType.sensorOpen,
          DeviceType.sensorMotion,
          DeviceType.sensorGas,
          DeviceType.sensorSmoke,
          DeviceType.sensorVibration,
          DeviceType.sensorWaterLeak
        ],
      SelectDeviceType.curtain => [
          DeviceType.openableCurtain,
        ],
      SelectDeviceType.scenarios => [],
      SelectDeviceType.hidden => DeviceType.values.toList(),
    };
  }
}

final class MonitorPanel extends StatefulWidget {
  const MonitorPanel({
    super.key,
    this.roomId,
    required this.roomTabController,
  });

  final int? roomId;
  final RoomsTabController roomTabController;

  @override
  State<MonitorPanel> createState() => _MonitorPanelState();
}

class _MonitorPanelState extends State<MonitorPanel> {
  late final SelectDeviceTypeController selectDeviceTypeController;

  @override
  void initState() {
    super.initState();
    selectDeviceTypeController = SelectDeviceTypeController();
    _resetByRoomChange();
  }

  void _resetByRoomChange() {
    RoomEntity? lastRoom;
    context.read<RoomsTabController>().addListener(() {
      if (mounted == false) return;
      final room = context.read<RoomsTabController>().selectedRoom;
      if (room != lastRoom) {
        lastRoom = room;
        selectDeviceTypeController.value = null;
      }
    });
  }

  @override
  void didUpdateWidget(covariant MonitorPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.roomTabController != widget.roomTabController) {
      selectDeviceTypeController.value = null;
      _resetByRoomChange();
    }
  }

  bool deviceFilter(DeviceEntity device) =>
      widget.roomId == null || device.roomId == widget.roomId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: selectDeviceTypeController,
      child: DevicesBlocBuilder(
          filter: (device) => deviceFilter(device),
          builder: (context, allDevices) {
            final selectedType =
                context.watch<SelectDeviceTypeController>().value;
            final data = allDevices
                .where((device) =>
                    deviceFilterBySelectedType(device, selectedType))
                .toList();
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SelectDeviceTypeRow(
                      activeType: selectedType,
                      devices: allDevices,
                      isAllRooms: widget.roomId == null,
                      onSelected: (type) {
                        context.read<SelectDeviceTypeController>().value = type;
                      },
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LayoutBuilder(builder: (context, cs) {
                        final deviceScenarios =
                            DeviceScenariosScope.of(context).state.data!;
                        return StaggeredGrid.count(
                          crossAxisCount: (cs.maxWidth ~/ 220).clamp(2, 5),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          axisDirection: AxisDirection.down,
                          children: [
                            if (selectedType == SelectDeviceType.light) ...[
                              LightSmallWidget(
                                filter: deviceFilter,
                              ),
                            ] else if (selectedType ==
                                SelectDeviceType.door) ...[
                              AllDoorWidgetWidget(
                                filter: deviceFilter,
                              ),
                            ] else if (selectedType ==
                                SelectDeviceType.curtain) ...[
                              AllCurtainsWidgetWidget(
                                filter: deviceFilter,
                              ),
                            ],
                            if (selectedType == SelectDeviceType.scenarios) ...[
                              for (final scenario in deviceScenarios) ...[
                                DeviceScenarioOnMonitor(
                                  scenario: scenario,
                                ),
                              ],
                            ] else
                              for (final device in data) ...[
                                DeviceOnMonitor(
                                  device: device,
                                ),
                              ],
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class SelectDeviceTypeController extends ValueNotifier<SelectDeviceType?> {
  SelectDeviceTypeController() : super(null);
}

enum SelectDeviceType {
  scenarios,
  light,
  door,
  sensor,
  curtain,
  hidden,
}

class SelectDeviceTypeRow extends StatelessWidget {
  const SelectDeviceTypeRow({
    super.key,
    required this.devices,
    this.onSelected,
    required this.activeType,
    this.isAllRooms = true,
  });

  final void Function(SelectDeviceType? type)? onSelected;
  final SelectDeviceType? activeType;
  final List<DeviceEntity> devices;
  final bool isAllRooms;

  @override
  Widget build(BuildContext context) {
    final deviceScenarios = DeviceScenariosScope.of(context).state.data!;

    final hiddenDevices =
        devices.where((device) => device.isHidden == true).toList();

    final lights = devices
        .where((device) =>
            DeviceSelectTypeMapper.toDeviceTypes(from: SelectDeviceType.light)
                .contains(device.type))
        .toList();
    final lightsOnCount = lights
        .where((device) => device.capabilities
            .where((c) =>
                (c.state is DeviceCapabilityStateOnEntity) &&
                (c.state as DeviceCapabilityStateOnEntity).value == true)
            .isNotEmpty)
        .length;

    final doors = devices
        .where((device) =>
            DeviceSelectTypeMapper.toDeviceTypes(from: SelectDeviceType.door)
                .contains(device.type))
        .toList();
    final doorsClosed = doors
        .where((device) => device.capabilities
            .where((c) =>
                (c.state is DeviceCapabilityStateOnEntity) &&
                (c.state as DeviceCapabilityStateOnEntity).value == false)
            .isNotEmpty)
        .length;

    final sensors = devices
        .where((device) =>
            DeviceSelectTypeMapper.toDeviceTypes(from: SelectDeviceType.sensor)
                .contains(device.type))
        .toList();

    final sensorClimate = sensors
        .firstWhereOrNull((device) => device.type == DeviceType.sensorClimate);

    final sensorClimateTemp = sensorClimate?.properties
        .map((p) => switch (p.state) {
              DeviceCapabilityStateTemperatureEntity p => p.value,
              _ => null
            })
        .firstWhereOrNull((value) => value != null)
        ?.toInt();

    final sensorClimateHumidity = sensorClimate?.properties
        .map((p) => switch (p.state) {
              DeviceCapabilityStateHumidityEntity p => p.value,
              _ => null
            })
        .firstWhereOrNull((value) => value != null)
        ?.toInt();

    final curtains = devices
        .where((device) =>
            DeviceSelectTypeMapper.toDeviceTypes(from: SelectDeviceType.curtain)
                .contains(device.type))
        .toList();

    final curtainsOpenCount = curtains
        .where((device) => device.capabilities
            .where((c) =>
                (c.state is DeviceCapabilityStateOpenEntity) &&
                (c.state as DeviceCapabilityStateOpenEntity).value != 0)
            .isNotEmpty)
        .length;

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppPaddings.horizontal,
        child: Wrap(
          spacing: 8,
          children: [
            if (isAllRooms && deviceScenarios.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.device_hub_outlined,
                title: 'Сценарии',
                subtitle: '${deviceScenarios.length} сцен',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.scenarios,
              ),
            if (lights.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.lightbulb_outlined,
                title: 'Свет',
                subtitle: '${lights.length} · $lightsOnCount вкл',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.light,
              ),
            if (doors.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.door_sliding_outlined,
                title: 'Двери',
                subtitle: '${doors.length} · $doorsClosed закр',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.door,
              ),
            if (sensors.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.thermostat_outlined,
                title: 'Датчики',
                // температура и влажность
                subtitle: sensorClimate != null
                    ? '${sensorClimateTemp ?? '--'}°C ${sensorClimateHumidity ?? '--'}%'
                    : '${sensors.length} устр',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.sensor,
              ),
            if (curtains.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.curtains_outlined,
                title: 'Шторы',
                // температура и влажность
                subtitle: '${curtains.length} · $curtainsOpenCount откр',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.curtain,
              ),
            if (hiddenDevices.isNotEmpty)
              _SelectDeviceTypeRowItem(
                icon: Icons.visibility_off_outlined,
                title: 'Скрытые',
                subtitle: '${hiddenDevices.length} устр',
                onTap: onSelected,
                activeType: activeType,
                type: SelectDeviceType.hidden,
              ),
          ],
        ),
      ),
    );
  }
}

class _SelectDeviceTypeRowItem extends StatelessWidget {
  const _SelectDeviceTypeRowItem({
    // ignore: unused_element_parameter
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.activeType,
    required this.type,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final void Function(SelectDeviceType? type)? onTap;
  final SelectDeviceType? activeType;
  final SelectDeviceType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(activeType == type ? null : type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 73, 73, 73),
          borderRadius: BorderRadius.circular(12),
          border: activeType == type
              ? Border.all(
                  color: Colors.white,
                  width: 1.5,
                )
              : Border.all(
                  color: const Color.fromARGB(255, 73, 73, 73),
                  width: 1.5,
                ),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
