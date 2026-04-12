import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class ActionDelayModalScreen extends StatefulWidget {
  const ActionDelayModalScreen({
    super.key,
  });

  Future<ActionEntity?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      pageBuilder: (context) => this,
    );
  }

  @override
  State<ActionDelayModalScreen> createState() => _ActionDelayModalScreenState();
}

class _ActionDelayModalScreenState extends State<ActionDelayModalScreen> {
  late final ValueNotifier<int> _delayController;

  @override
  void initState() {
    super.initState();
    _delayController = ValueNotifier(1);
  }

  @override
  void dispose() {
    _delayController.dispose();
    super.dispose();
  }

  void _submit() {
    final action = ActionEntity.delay(
      seconds: _delayController.value,
    );
    Navigator.of(context).pop(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.horizontal.copyWith(top: 40),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ValueListenableBuilder<int?>(
                valueListenable: _delayController,
                builder: (context, value, child) {
                  return TextFormField(
                    initialValue: value?.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _delayController.value = int.tryParse(value) ?? 1;
                    },
                    decoration: InputDecoration(
                      labelText: 'Задержка (секунды)',
                    ),
                  );
                },
              ),
              Spacer(),
              const SizedBox(height: 30),
              AppFormButton.primary(
                onPressed: _submit,
                child: Text('Добавить'),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
