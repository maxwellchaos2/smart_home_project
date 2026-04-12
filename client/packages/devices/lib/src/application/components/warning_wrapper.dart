import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';

class WarningWrapper extends StatelessWidget {
  const WarningWrapper({
    super.key,
    required this.controller,
    required this.child,
  });

  final WarningController controller;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(child: child),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return AnimatedCrossFade(
                crossFadeState: controller.hasWarning
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                secondChild: const SizedBox(),
                duration: const Duration(milliseconds: 200),
                firstChild: Builder(
                  builder: (context) {
                    if (!controller.hasWarning) {
                      return const SizedBox();
                    }
                    return Hero(
                      tag: 'warning',
                      flightShuttleBuilder: (flightContext, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        if (flightDirection == HeroFlightDirection.push) {
                          return const SizedBox();
                        }
                        return Material(
                          color: Colors.transparent,
                          child: toHeroContext.widget,
                        );
                      },
                      child: SizedBox(
                        width: 600,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: WarningDialog(
                            title: controller.message!.title,
                            message: controller.message!.message,
                            showCancelButton: false,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class WarningListener extends SingleChildStatelessWidget {
  const WarningListener({
    super.key,
    required this.controller,
  });

  final WarningController controller;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DevicesBlocListener(
      listener: (context, state) => state.mapOrNull(
        success: (state) async {
          for (final device in state.data) {
            for (final property in device.properties) {
              if (property is DevicePropertyEventEntity) {
                if (property.state?['instance'] == 'water_leak' &&
                    property.state?['value'] == 'leak') {
                  controller.setMessage(
                    (
                      title: 'Обнаружена протечка!',
                      message:
                          'Внимание! В системе обнаружена протечка воды. Пожалуйста, проверьте все краны и сантехнику.',
                    ),
                  );
                  await WarningDialog(
                    title: controller.message!.title,
                    message: controller.message!.message,
                  ).show(context);
                } else if (property.state?['instance'] == 'water_leak' &&
                    property.state?['value'] == 'dry') {
                  if (controller.message?.title == 'Обнаружена протечка!') {
                    controller.clearMessage();
                  }
                } else if (property.state?['instance'] == 'smoke' &&
                    property.state?['value'] == 'detected') {
                  controller.setMessage(
                    (
                      title: 'Обнаружен дым!',
                      message:
                          'Внимание! В системе обнаружен дым. Пожалуйста, проверьте помещение на наличие дыма и возможных источников возгорания.',
                    ),
                  );
                  await WarningDialog(
                    title: controller.message!.title,
                    message: controller.message!.message,
                  ).show(context);
                } else if (property.state?['instance'] == 'smoke' &&
                    property.state?['value'] == 'not_detected') {
                  if (controller.message?.title == 'Обнаружен дым!') {
                    controller.clearMessage();
                  }
                }
              }
            }
          }
          return null;
        },
      ),
      child: child,
    );
  }
}
