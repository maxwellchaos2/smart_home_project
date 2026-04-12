import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigator/navigator.dart';

class AdaptiveDatePicker extends StatelessWidget {
  const AdaptiveDatePicker({super.key, this.useCupertino});

  final bool? useCupertino;

  Future<DateTime?> show(BuildContext context) async {
    if (useCupertino ?? Platform.isIOS) {
      return showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (context) => this,
      );
    }
    return showDialog<DateTime>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final initialDate = DateTime(DateTime.now().year - 25);
    final firstDate = DateTime.now().subtract(const Duration(days: 120 * 365));
    final lastDate = DateTime.now();
    return useCupertino ?? Platform.isIOS
        ? _CupertinoDatePicker(
            initialDate: initialDate,
            lastDate: lastDate,
            firstDate: firstDate,
          )
        : Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodySmall: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ),
            child: DatePickerDialog(
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
            ),
          );
  }
}

class _CupertinoDatePicker extends StatefulWidget {
  const _CupertinoDatePicker({
    required this.initialDate,
    required this.lastDate,
    required this.firstDate,
  });

  final DateTime initialDate;
  final DateTime lastDate;
  final DateTime firstDate;

  @override
  State<_CupertinoDatePicker> createState() => _CupertinoDatePickerState();
}

class _CupertinoDatePickerState extends State<_CupertinoDatePicker> {
  late DateTime _currentDate = widget.initialDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              color: switch (context.theme.brightness) {
                Brightness.light => Colors.grey[100],
                _ => null,
              },
              height: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      'Готово',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () => context.navigator.popForced(_currentDate),
                  )
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: widget.initialDate,
                maximumDate: widget.lastDate,
                minimumDate: widget.firstDate,
                onDateTimeChanged: (date) => _currentDate = date,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
