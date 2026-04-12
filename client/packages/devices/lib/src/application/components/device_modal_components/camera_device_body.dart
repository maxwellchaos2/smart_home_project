import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/application/screens/camera_archive_screen.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';

class CameraDeviceBody extends StatefulWidget {
  const CameraDeviceBody({super.key, required this.device});

  final DeviceEntity device;

  @override
  State<CameraDeviceBody> createState() => _CameraDeviceBodyState();
}

class _CameraDeviceBodyState extends State<CameraDeviceBody> {
  late final AccessInfoInputEntity accessInfo;
  late final String rtspUrl;
  late final DeviceEntity? cameraHub;

  @override
  void initState() {
    super.initState();
    cameraHub = DevicesScope.of(context).state.data?.firstWhere((d) =>
        d.id.toString() == widget.device.providerDeviceId &&
        d.type == DeviceType.cameraHub);

    if (cameraHub == null) {
      final customData = widget.device.customData;
      accessInfo = AccessInfoInputEntity(
        ipAddress: customData?['ip'] as String? ?? '',
        port: int.tryParse(customData?['port'] as String? ?? '-') ?? 554,
        username: customData?['username'] as String? ?? '',
        password: customData?['password'] as String? ?? '',
      );
      final channel = customData?['channel'] as String? ?? '1';
      //  rtsp://admin:565758Ss@192.168.0.13/Streaming/channels/101/
      // rtsp://admin:565758Ss@192.168.0.13/Streaming/tracks/101/  - это запись

      rtspUrl =
          'rtsp://${accessInfo.username}:${accessInfo.password}@${accessInfo.ipAddress}:${accessInfo.port}/ISAPI/Streaming/channels/$channel';
    } else {
      final customData = cameraHub!.customData;
      final rtspPort = customData?['rtspPort'] as String? ?? '554';
      accessInfo = AccessInfoInputEntity(
        ipAddress: customData?['ip'] as String? ?? '',
        port: int.tryParse(customData?['port'] as String? ?? '-') ?? 80,
        username: customData?['username'] as String? ?? '',
        password: customData?['password'] as String? ?? '',
      );
      final channelId =
          widget.device.customData?['channelId'] as String? ?? '1';
      rtspUrl =
          'rtsp://${accessInfo.username}:${accessInfo.password}@${accessInfo.ipAddress}:$rtspPort/ISAPI/Streaming/channels/${channelId}01';
    }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: CameraPlayer(
            rtspUrl: rtspUrl,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton.icon(
            onPressed: () => _openArchive(context),
            icon: const Icon(Icons.video_library),
            label: const Text('Просмотр архива'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _openArchive(BuildContext context) {
    final channelId = cameraHub == null
        ? (widget.device.customData?['channel'] as String? ?? '1')
        : (widget.device.customData?['channelId'] as String? ?? '1');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraArchiveScreen(
          device: widget.device,
          accessInfo: accessInfo,
          trackId: '${channelId}01',
        ),
      ),
    );
  }
}
