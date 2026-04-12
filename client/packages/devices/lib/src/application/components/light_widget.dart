import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

class LightWidget extends StatefulWidget {
  const LightWidget({
    super.key,
    this.iconSize = 45,
    this.filter,
  });

  final double iconSize;
  final bool Function(DeviceEntity)? filter;

  @override
  State<LightWidget> createState() => _LightWidgetState();
}

class _LightWidgetState extends State<LightWidget> {
  late final _overlayController = OverlayPortalController();
  late final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6F6F6F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DevicesBlocBuilder(
                  filter: (device) =>
                      device.type == DeviceType.light &&
                      (widget.filter?.call(device) ?? true),
                  builder: (context, data) {
                    final isOn = data.any((element) =>
                        element.capabilities
                            .byTypeOrNull<DeviceCapabilityStateOnEntity>()
                            ?.value ??
                        false);
                    return (isOn
                            ? Assets.icons.devices.light
                            : Assets.icons.devices.lightOff)
                        .svg(
                      width: widget.iconSize,
                      height: widget.iconSize,
                    );
                  }),
              const SizedBox(width: 4),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Свет',
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.w500)
                        .reverseMerge(context.textTheme.titleLarge),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              AllLightSwitch(
                filter: widget.filter,
              ),
            ],
          ),
          const SizedBox(height: 8),
          CompositedTransformTarget(
            link: _link,
            child: OverlayPortal(
              controller: _overlayController,
              overlayChildBuilder: (context) => Stack(
                children: [
                  // ModalBarrier(
                  //   onDismiss: () {
                  //     _overlayController.hide();
                  //   },
                  // ),

                  Listener(
                    onPointerMove: (_) {
                      _overlayController.hide();
                    },
                    onPointerDown: (_) {
                      _overlayController.hide();
                    },
                    behavior: HitTestBehavior.opaque,
                  ),

                  CompositedTransformFollower(
                    link: _link,
                    targetAnchor: Alignment.bottomLeft,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: _Overlay(
                        filter: widget.filter,
                      ),
                    ),
                  ),
                ],
              ),
              child: OutlinedButton(
                onPressed: _overlayController.toggle,
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.theme.colorScheme.onSurface,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Светильники отдельно',
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay({
    this.filter,
  });

  final bool Function(DeviceEntity)? filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF585858),
        child: DevicesBlocBuilder(
          filter: (device) =>
              device.type == DeviceType.light && (filter?.call(device) ?? true),
          builder: (context, data) {
            return ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                  child: Text(
                    'Свет',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                for (final device in data) ...[
                  Divider(
                    height: 0,
                    color: Colors.white.withOpacity(.35),
                  ),
                  _OverlayItem(
                    name: device.name,
                    isActive: device.capabilities
                            .byTypeOrNull<DeviceCapabilityStateOnEntity>()
                            ?.value ??
                        false,
                    onChanged: device.capabilities.byTypeOrNull<
                                DeviceCapabilityStateOnEntity>() ==
                            null
                        ? null
                        : (value) {
                            DevicesScope.of(context).updateDevicesCapabilities(
                              inputs: [
                                (
                                  device: device,
                                  input: [
                                    DeviceCapabilityEntity.onOff(
                                      state: DeviceCapabilityStateEntity.on(
                                        value: value,
                                      ),
                                      parameters: null,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OverlayItem extends StatelessWidget {
  const _OverlayItem({
    required this.name,
    required this.isActive,
    required this.onChanged,
  });

  final String name;
  final bool isActive;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChanged?.call(!isActive);
      },
      title: Text(
        name,
      ),
      dense: true,
      contentPadding: const EdgeInsets.only(left: 12),
      trailing: Transform.scale(
        scale: .9,
        child: Switch(
          value: isActive,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
