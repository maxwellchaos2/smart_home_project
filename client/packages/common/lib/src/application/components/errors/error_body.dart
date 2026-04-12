import 'package:common/common.dart';

final class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String? message;

  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message ?? 'Неизвестная ошибка',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              AppFormButton.primary(
                onPressed: onRetry,
                child: const Text('Повторить'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
