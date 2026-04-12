import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';
import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart'; // Provides [Video] widget for video rendering.

class DoorWithLockDeviceBody extends StatefulWidget {
  const DoorWithLockDeviceBody({super.key, required this.device});

  final DeviceEntity device;

  @override
  State<DoorWithLockDeviceBody> createState() => _DoorWithLockDeviceBodyState();
}

class _DoorWithLockDeviceBodyState extends State<DoorWithLockDeviceBody> {
  late final AccessInfoInputEntity accessInfo;
  late final String rtspUrl;
  @override
  void initState() {
    super.initState();
    final customData = widget.device.customData;
    accessInfo = AccessInfoInputEntity(
      ipAddress: customData?['ip'] as String? ?? '',
      port: int.tryParse(customData?['port'] as String? ?? '-') ?? 80,
      username: customData?['username'] as String? ?? '',
      password: customData?['password'] as String? ?? '',
    );
    final rtspPort = customData?['rtspPort'] as String? ?? '554';
    rtspUrl =
        'rtsp://${accessInfo.username}:${accessInfo.password}@${accessInfo.ipAddress}:$rtspPort/ISAPI/Streaming/channels/101';
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
    return IsapiEventsScope(
      accessInfo: accessInfo,
      child: StatefulBuilderWidget(initState: (context) {
        IsapiEventsScope.of(context).paginate();
      }, builder: (context, _) {
        final events = IsapiEventsScope.of(context, listen: true).state.data;
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
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (checkDeviceIsOff(widget.device))
                          ? getIconsByDeviceType(type: widget.device.type)
                              .iconOff
                              .svg(
                                width: 30,
                              )
                          : getIconsByDeviceType(type: widget.device.type)
                              .icon
                              .svg(
                                width: 30,
                              ),
                      const SizedBox(width: 8),
                      Text(
                        (checkDeviceIsOff(widget.device))
                            ? 'Закрыта'
                            : 'Открыта',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                for (final capability in widget.device.capabilities) ...[
                  if (capability.state is DeviceCapabilityStateOnEntity) ...[
                    _LockButton(
                      value: (capability.state as DeviceCapabilityStateOnEntity)
                          .value!,
                      onChanged: (value) {
                        DevicesScope.of(context).updateDevicesCapabilities(
                          inputs: [
                            (
                              device: widget.device,
                              input: [
                                DeviceCapabilityEntity.onOff(
                                  state: DeviceCapabilityStateOnEntity(
                                    value: value,
                                  ),
                                  parameters: null,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    )
                  ]
                ]
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                GestureDetector(
                  onTap: () => IsapiEventsScope.of(context).refresh(),
                  child: Icon(Icons.refresh),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'События',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => context.navigator.push(
                    IsapiEventsScreen(
                      accessInfo: accessInfo,
                    ).page,
                  ),
                  child: Text('Показать все'),
                ),
              ],
            ),
            for (final event in events ?? <IsapiEventEntity>[]) ...[
              IsapiEventRow(event: event),
            ]
          ],
        );
      }),
    );
  }
}

class CameraPlayer extends StatefulWidget {
  final String rtspUrl;
  final void Function(Duration position)? onPositionChanged;

  const CameraPlayer({
    required this.rtspUrl,
    this.onPositionChanged,
    super.key,
  });

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();
}

class _CameraPlayerState extends State<CameraPlayer> {
  // Create a [Player] to control playback.
  late final _player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final _controller = VideoController(_player);

  @override
  void initState() {
    super.initState();

    // Инициализируем контроллер с минимальными опциями для быстрого старта
    setupPlayer().then(
      (_) {
        _player.open(
          Media(
            widget.rtspUrl,
          ),
        );
      },
    );

    _player.stream.position.listen((position) {
      if (widget.onPositionChanged != null) {
        widget.onPositionChanged!(position);
      }
    });
  }

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rtspUrl != widget.rtspUrl) {
      _controller.player.open(Media(widget.rtspUrl));
    }
  }

  Future<void> setupPlayer() async {
    await _player.setSubtitleTrack(SubtitleTrack.no());

    /// Setup of NativePlayer for Both Android and iOS.
    /// Here is the MPV (player) configuration at low level.
    if (_controller.player.platform is NativePlayer) {
      // For more options: https://mpv.io/manual/master/#encoding
      var nativePlayer = _controller.player.platform as NativePlayer;
      if (widget.rtspUrl.startsWith("rtsp://")) {
        if (Platform.isAndroid) {
          await nativePlayer.setProperty('profile', 'low-latency');
          // Try to reduce the cache in the video rendering driver
          await nativePlayer.setProperty('opengl-glfinish', 'yes');
        } else {
          // For iOS or other platforms
          await nativePlayer.setProperty("rtsp-flags", 'auto');
          await nativePlayer.setProperty("rtsp_transport", 'tcp');
          await nativePlayer.setProperty("vcodec", 'h264');
          // Request low latency profile
          await nativePlayer.setProperty("packet-buffering", '0');
          await nativePlayer.setProperty("packet-max_delay", '0');
          await nativePlayer.setProperty('low-latency', 'yes');
          await nativePlayer.setProperty('opengl-glfinish', 'yes');
          // dropping the frames will help player to prevent crashing on error
          await nativePlayer.setProperty("drop-on-error", 'yes');
        }
      } else if (widget.rtspUrl.startsWith("rtmp://")) {
        await nativePlayer.setProperty("low-latency", 'yes');
        await nativePlayer.setProperty("drop-on-error", 'yes');
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Video(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ],
      ),
    );
  }
}

class _LockButton extends StatelessWidget {
  const _LockButton({
    this.onChanged,
    required this.value,
  });

  final ValueChanged<bool>? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            value
                ? Assets.icons.lockOpen.svg(
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.orangeAccent,
                      BlendMode.srcIn,
                    ),
                  )
                : Assets.icons.lock.svg(
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8),
                      BlendMode.srcIn,
                    ),
                  ),
            const SizedBox(width: 8),
            Text(
              !value ? 'Открыть' : 'Закрыть',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
