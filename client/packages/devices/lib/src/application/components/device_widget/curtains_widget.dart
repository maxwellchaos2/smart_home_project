import 'dart:ui' as ui;

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

final class CurtainWidget extends BaseDeviceWidget {
  const CurtainWidget({
    super.key,
    required super.device,
    super.iconSize,
  });

  DeviceCapabilityStateOpenEntity? getOpenState() {
    return device.capabilities.byTypeOrNull();
  }

  DeviceCapabilityParametersOpenEntity getOpenParameters() {
    return device.capabilities.parametersByType();
  }

  @override
  Widget build(BuildContext context) {
    return UpdateValueIfPointerUpWidget(
      value: getOpenState(),
      onNeedUpdate: (openState) {
        DevicesScope.of(context).updateDevicesCapabilities(
          inputs: [
            (
              device: device,
              input: [
                DeviceCapabilityEntity.range(
                  state: openState,
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
      builder: (context, openState, setValue) {
        final openParameters = getOpenParameters();
        return containerWrapper(
          child: Column(
            children: [
              Row(
                children: [
                  buildIcon(context),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildName(context),
                        buildRoomName(context),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Открыто ~ ${(openState?.value)?.toInt()}%',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AppSlider(
                value: openState?.value ?? openParameters.range?.min ?? 0,
                min: openParameters.range?.min,
                max: openParameters.range?.max,
                precision: openParameters.range?.precision,
                onChanged: (value) =>
                    setValue(DeviceCapabilityStateOpenEntity(value: value)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          setValue(DeviceCapabilityStateOpenEntity(value: 0)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.onSurface,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Закрыть',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          setValue(DeviceCapabilityStateOpenEntity(value: 100)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.onSurface,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Открыть',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
    required this.value,
    this.min,
    this.max,
    this.precision,
    this.onChanged,
  });

  final double value;
  final double? min;
  final double? max;
  final double? precision;
  final void Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const ui.Color.fromARGB(255, 191, 191, 191),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 30,
              overlayShape: SliderComponentShape.noOverlay,
              thumbShape: SliderComponentShape.noThumb,
              trackShape: const MyRectSliderTrackShape(),
              inactiveTrackColor: const Color(0xFF6F6F6F),
              activeTrackColor: const Color(0xFFD9D9D9),
            ),
            child: Slider(
              value: value,
              divisions: precision != null
                  ? (((max ?? 1) - (min ?? 0)) / precision!).toInt()
                  : null,
              min: min ?? 0,
              max: max ?? 1,
              allowedInteraction: SliderInteraction.tapAndSlide,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}

class MyRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const MyRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    ui.Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required ui.Offset thumbCenter,
    ui.Offset? secondaryOffset,
    bool? isEnabled,
    bool? isDiscrete,
    required ui.TextDirection textDirection,
  }) {
    assert(sliderTheme.trackHeight != null);
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled ?? false,
      isDiscrete: isDiscrete ?? false,
    );

    final Paint activePaint = Paint()..color = sliderTheme.activeTrackColor!;
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    // final double thumbPos = (thumbCenter.dx - trackRect.left) / trackRect.width;

    final double thumbCenterX = thumbCenter.dx <= 15
        ? 0
        : trackRect.width - thumbCenter.dx <= 15
            ? trackRect.width
            : thumbCenter.dx;
    final Rect leftTrackSegment = Rect.fromLTRB(
      trackRect.left,
      trackRect.top,
      thumbCenterX,
      trackRect.bottom,
    );

    final Rect rightTrackSegment = Rect.fromLTRB(
      thumbCenterX,
      trackRect.top,
      trackRect.right,
      trackRect.bottom,
    );

    context.canvas.drawRect(leftTrackSegment, activePaint);
    context.canvas.drawRect(rightTrackSegment, inactivePaint);
  }
}
