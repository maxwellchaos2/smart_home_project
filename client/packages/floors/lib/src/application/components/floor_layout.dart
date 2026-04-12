import 'dart:math' as math;

import 'package:common/common.dart';
import 'package:device_positions/device_positions.dart';
import 'package:devices/devices.dart';
import 'package:floors/src/application/application.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rooms/rooms.dart';

import 'floors_tab_bar.dart';

final class FloorLayout extends StatefulWidget {
  const FloorLayout({
    super.key,
  });

  @override
  State<FloorLayout> createState() => _FloorLayoutState();
}

class _FloorLayoutState extends State<FloorLayout>
    with SingleTickerProviderStateMixin {
  late final FloorsTabController _tabController;
  late final RoomsTabController _roomsTabController;

  @override
  void initState() {
    super.initState();
    _tabController = FloorsTabController(
      floors: FloorsScope.of(context).state.data!,
      vsync: this,
    );

    _roomsTabController = context.read();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) setState(() {});
    });
  }

  int get floorId => _tabController.selectedFloor.id;

  bool deviceFilter(DeviceEntity device) =>
      floorId == device.floorId &&
      (
          // _roomsTabController.selectedRoom == null || TODO: uncomment
          device.roomId == _roomsTabController.selectedRoom?.id);

  String getFullPlanMediaPath(String planMediaPath) {
    final uri = Uri.parse(context.locator.get<IAppConfig>().apiUrl);

    return uri.replace(path: planMediaPath).toString();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Map<int, List<DevicePositionEntity>> deviceIdsDevicePositionsMap(
      List<DeviceEntity> devices) {
    final devicePositions =
        DevicePositionsScope.of(context, listen: true).state.data ??
            <DevicePositionEntity>[];

    final deviceIds = devices.map((device) => device.id).toSet();

    final devicePositionsMap = <int, List<DevicePositionEntity>>{};
    for (final devicePosition in devicePositions) {
      if (deviceIds.contains(devicePosition.deviceId)) {
        if (devicePositionsMap.containsKey(devicePosition.deviceId)) {
          devicePositionsMap[devicePosition.deviceId]!.add(devicePosition);
        } else {
          devicePositionsMap[devicePosition.deviceId] = [devicePosition];
        }
      }
    }
    return devicePositionsMap;
  }

  @override
  Widget build(BuildContext context) {
    final floor = FloorsScope.of(context, listen: true)
        .state
        .data!
        .firstWhere((element) => element.id == floorId);

    final interactiveViewerWidget = InteractiveViewer(
      maxScale: 3,
      // clipBehavior: Clip.none,
      child: LayoutBuilder(builder: (context, constraints) {
        final BoxConstraints sizeConstraints = constraints.loosen();
        final Size unconstrainedSize = sizeConstraints
            .constrainSizeAndAttemptToPreserveAspectRatio(Size(900, 700));
        final size = constraints.constrain(unconstrainedSize);

        final scaleX = size.width / 900;
        final scaleY = size.height / 700;
        final scale = math.min(scaleX, scaleY);

        return Transform.scale(
          scale: scale,
          child: OverflowBox(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            child: SizedBox(
              width: 900,
              height: 700,
              child: AnimatedBuilder(
                  animation: _roomsTabController,
                  builder: (context, _) {
                    return DevicesBlocBuilder(
                      filter: deviceFilter,
                      builder: (context, data) {
                        final devicePositionsMap =
                            deviceIdsDevicePositionsMap(data);
                        final urlPath =
                            switch (_roomsTabController.selectedRoom) {
                          null => floor.planMediaPath,
                          RoomEntity room =>
                            room.planMediaPath ?? floor.planMediaPath,
                        };
                        return Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  100.0), // TODO: change to 20 px
                              child: SvgPicture.network(
                                getFullPlanMediaPath(
                                  urlPath!,
                                ),
                                key: ValueKey(urlPath),
                                placeholderBuilder: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                clipBehavior: Clip.none,
                              ),
                            ),
                            for (final device in data) ...[
                              for (final position
                                  in devicePositionsMap[device.id] ??
                                      <DevicePositionEntity>[]) ...[
                                Positioned(
                                  top: position.y,
                                  left: position.x,
                                  child: Transform.rotate(
                                    angle: position.angle,
                                    child: DeviceOnFloorLayout(
                                      position: position,
                                      device: data.where(
                                        (device) {
                                          return device.id == position.deviceId;
                                        },
                                      ).first,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ],
                        );
                      },
                    );
                  }),
            ),
          ),
        );
      }),
    );

    return SizedBox.expand(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 0, bottom: 0),
            child: FloorsTabBar(
              controller: _tabController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 0, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: Transform.scale(
                    scale: 0.8,
                    alignment: Alignment.centerLeft,
                    child: RoomsTabBar(
                      controller: _roomsTabController,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      _showFullScreen(context, interactiveViewerWidget),
                  icon: Icon(Icons.fullscreen),
                ),
              ],
            ),
          ),
          Expanded(
            child: interactiveViewerWidget,
          ),
        ],
      ),
    );
  }

  void _showFullScreen(BuildContext context, Widget child) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close, color: Colors.white),
            ),
          ),
          body: Center(child: child),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: Center(
              child: child,
            ),
          );
        },
      ),
    );
  }
}
