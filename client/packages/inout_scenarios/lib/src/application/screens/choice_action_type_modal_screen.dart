import 'package:common/common.dart';

class ChoiceActionTypeModalScreen extends StatelessWidget {
  const ChoiceActionTypeModalScreen({super.key});

  Future<ActionType?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: AppPaddings.horizontal,
            child: Text(
              'Выберите действие',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ).reverseMerge(context.textTheme.titleMedium),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: AppPaddings.horizontal,
            title: const Text('Устройство'),
            onTap: () => Navigator.of(context).pop(ActionType.changeOutput),
          ),
          ListTile(
            contentPadding: AppPaddings.horizontal,
            title: const Text('Задержка'),
            onTap: () => Navigator.of(context).pop(ActionType.delay),
          ),
        ],
      ),
    );
  }
}

enum ActionType {
  changeOutput,
  delay,
}
