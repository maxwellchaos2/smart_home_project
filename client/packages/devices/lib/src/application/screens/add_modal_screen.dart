import 'package:common/common.dart';

class AddModalScreen extends AppModalBottomSheet {
  const AddModalScreen({super.key}) : super(paddingFromTop: 10);

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Добавить устройство',
          style: TextStyle(fontWeight: FontWeight.bold)
              .reverseMerge(context.textTheme.titleLarge),
        ),
        const SizedBox(height: 8),
        Text(
          'Выберите тип устройства, которое хотите добавить',
          style: TextStyle(
            color: context.theme.colorScheme.onSurface.withValues(alpha: .7),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _Button(
                onPressed: () =>
                    context.navigator.pushRoute('/add_wifi_devices'),
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Assets.icons.wifi.svg(
                    width: 32,
                    height: 32,
                  ),
                ),
                text: 'Wi-Fi',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _Button(
                onPressed: () =>
                    context.navigator.pushRoute('/add_zigbee_devices'),
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Assets.icons.zigbee.svg(
                    width: 32,
                    height: 32,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(214, 45, 62, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                text: 'Zigbee',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _Button(
                onPressed: () =>
                    context.navigator.pushRoute('/add_yandex_devices'),
                icon: Assets.icons.alisaSmartHome.svg(
                  width: 32,
                  height: 32,
                ),
                text: 'Умного дома Алиса',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    // ignore: unused_element_parameter
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
  });

  final void Function()? onPressed;
  final Widget icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppFormButton.secondary(
      onPressed: () {
        context.navigator.popForced();
        context.mainScaffoldKey.currentState?.closeDrawer();
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: context.theme.colorScheme.onPrimary,
        minimumSize: const Size(0, 90),
        maximumSize: const Size(double.infinity, 90),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          icon,
          const SizedBox(height: 8),
          Expanded(
            child: Center(
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
