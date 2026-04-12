import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/scopes/update_device_scope.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';

class CameraHubDeviceBody extends StatefulWidget {
  const CameraHubDeviceBody({super.key, required this.device});

  final DeviceEntity device;

  @override
  State<CameraHubDeviceBody> createState() => _CameraHubDeviceBodyState();
}

class _CameraHubDeviceBodyState extends State<CameraHubDeviceBody> {
  late final AccessInfoInputEntity accessInfo;
  @override
  void initState() {
    super.initState();
    final customData = widget.device.customData;
    accessInfo = AccessInfoInputEntity(
      ipAddress: customData?['ip'] as String? ?? '',
      port: int.tryParse(customData?['port'] as String? ?? '-') ?? 554,
      username: customData?['username'] as String? ?? '',
      password: customData?['password'] as String? ?? '',
    );
  }

  void createDevice(InputProxyChannelEntity channel) {
    final newDevice = DeviceInputEntity(
      isHidden: false,
      providerDeviceId: widget.device.id.toString(),
      type: DeviceType.camera,
      capabilities: [],
      properties: [],
      roomId: null,
      floorId: null,
      providerType: DeviceProviderType.hikvision,
      name: channel.name,
      customData: {
        'channelId': channel.id,
      },
    );
    final scope = CreateDeviceScope(
      projectId: widget.device.projectId,
    );
    final controller = scope.createController(scope.createBloc(context));
    controller.create(input: newDevice);
  }

  void updateDevice(DeviceEntity device, InputProxyChannelEntity channel) {
    if (device.customData?['channelId'] == channel.id &&
        device.name == channel.name) {
      return;
    }
    final input = DeviceInputEntity(
      isHidden: device.isHidden,
      providerDeviceId: device.providerDeviceId,
      type: device.type,
      capabilities: device.capabilities,
      properties: device.properties,
      roomId: device.roomId,
      floorId: device.floorId,
      providerType: device.providerType,
      name: channel.name,
      customData: {
        ...?device.customData,
        'channelId': channel.id,
      },
    );
    final scope = UpdateDeviceScope(
      deviceId: device.id,
      projectId: widget.device.projectId,
    );
    final controller = scope.createController(scope.createBloc(context));
    controller.update(input: input);
  }

  @override
  Widget build(BuildContext context) {
    // Проверяем, есть ли в дереве виджетов ValueKey('device_screen_scaffold_hero')
    bool hasHeroKey = false;
    context.visitAncestorElements((element) {
      if (element.widget.key == const ValueKey('device_screen_scaffold_hero')) {
        hasHeroKey = true;
        return false; // Останавливаем поиск
      }
      return true; // Продолжаем поиск
    });

    if (hasHeroKey) {
      return const SizedBox.shrink();
    }
    final cameraDevices = DevicesScope.of(context, listen: true)
        .state
        .data!
        .map(
          (e) => e,
        )
        .where(
          (device) =>
              device.type == DeviceType.camera &&
              device.providerType == DeviceProviderType.hikvision &&
              device.providerDeviceId == widget.device.id.toString(),
        );
    return InputProxyChannelsScope(
      accessInfo: accessInfo,
      child: InputProxyChannelsBlocListener(
        listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              for (final channel in state.data) {
                final exists = cameraDevices.any((device) {
                  final customData = device.customData;
                  final channelId = customData?['channelId'] as String? ?? '';
                  return channelId == channel.id;
                });
                if (!exists) {
                  createDevice(channel);
                } else {
                  final device = cameraDevices.firstWhere((device) {
                    final customData = device.customData;
                    final channelId = customData?['channelId'] as String? ?? '';
                    return channelId == channel.id;
                  });
                  updateDevice(device, channel);
                }
              }
              return null;
            }),
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text('Обновить список устройств'),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      InputProxyChannelsScope.of(context).fetch();
                    },
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
