import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:flutter/cupertino.dart';

class ChooseDeviceModalScreen extends StatefulWidget {
  const ChooseDeviceModalScreen({
    super.key,
  });

  Future<DeviceEntity?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      pageBuilder: (context) => this,
    );
  }

  @override
  State<ChooseDeviceModalScreen> createState() =>
      _ChooseDeviceModalScreenState();
}

class _ChooseDeviceModalScreenState extends State<ChooseDeviceModalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите устройство'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              for (final device in DevicesScope.of(context).state.data!) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(device);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 45,
                            child: getIconsByDeviceType(type: device.type)
                                .icon
                                .svg(
                                  width: 45,
                                  height: 45,
                                ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              device.name,
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
