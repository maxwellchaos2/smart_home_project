import 'package:common/common.dart';

final class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.errorMessage,
  });

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        errorMessage ?? 'Неизвестная ошибка',
        textAlign: TextAlign.center,
      ),
      title: const Text(
        'Ошибка',
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding:
          const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 16),
      actions: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 42, minWidth: 120),
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () => context.navigator.popForced(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 47),
              ),
              child: const Text('Ок'),
            );
          }),
        )
      ],
    );
  }
}
