import 'package:common/common.dart';
import 'package:devices/devices.dart' hide HSVColor;
import 'package:devices/src/application/application.dart';
import 'package:devices/src/application/screens/device_screen.dart';
import 'package:rooms/rooms.dart';

class DeviceModalSheet extends StatefulWidget {
  const DeviceModalSheet({
    super.key,
    required this.device,
    required this.heroTag,
  });

  final DeviceEntity device;
  final String heroTag;

  Future<void> show(BuildContext context) {
    final scaleSize = context.read<double>();
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      duration: Duration(milliseconds: 600),
      builder: (_) => Provider.value(
        value: scaleSize,
        child: this,
      ),
    );
  }

  @override
  State<DeviceModalSheet> createState() => _DeviceModalSheetState();
}

class _DeviceModalSheetState extends State<DeviceModalSheet> {
  late final AppNavigatorController _navigatorController;

  @override
  void initState() {
    super.initState();
    _navigatorController = AppNavigatorController(initialPages: [
      DeviceScreen(heroTag: widget.heroTag).page,
    ])
      ..registerRoute(
        '/',
        () => DeviceScreen(
          heroTag: widget.heroTag,
        ).page,
      )
      ..registerRoute(
        '/edit',
        () => DeviceEditScreen(device: widget.device).page,
      )
      ..registerRoute(
        '/rooms',
        () => RoomsScreen().page,
      );
  }

  @override
  Widget build(BuildContext context) {
    return DeviceScope(
      deviceId: widget.device.id,
      initData: widget.device,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top -
              50,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: AppNavigator(
              controller: _navigatorController,
            ),
          ),
        ),
      ),
    );
  }
}
