import 'dart:math';

import 'package:flutter/services.dart';

final class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    newValue = FilteringTextInputFormatter.digitsOnly
        .formatEditUpdate(oldValue, newValue);
    final newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 1;
    // final isDeleted = oldValue.text.length > newValue.text.length;
    // if (isDeleted && newTextLength == 0) {
    //   return oldValue;
    // }
    final newTextBuffer = StringBuffer();
    if (newValue.text == oldValue.text.replaceAll(RegExp('[^0-9]'), '') &&
        (oldValue.text.endsWith('-') || oldValue.text.endsWith(' '))) {
      return TextEditingValue(
        text: oldValue.text.substring(0, oldValue.text.length - 1),
        selection: TextSelection.collapsed(offset: oldValue.selection.end - 1),
      );
    }
    if (newTextLength >= 1) {
      newTextBuffer.write('+7');
      if (newValue.selection.end >= 1) {
        selectionIndex += newValue.text.startsWith(RegExp(r'[78]')) ? 1 : 2;
      }
      if (newTextLength >= 2 || !newValue.text.startsWith(RegExp(r'[78]'))) {
        if (!newValue.text.startsWith(RegExp(r'[78]'))) usedSubstringIndex = 0;
        // ignore: prefer_interpolation_to_compose_strings
        newTextBuffer.write(' ' +
            newValue.text.substring(usedSubstringIndex,
                usedSubstringIndex = min(newTextLength, 4)));
        if (newValue.selection.end >= 1) {
          selectionIndex += newValue.text.startsWith(RegExp(r'[78]')) ? 1 : 1;
        }
      }
    }
    if (newTextLength >= 4) {
      // ignore: prefer_interpolation_to_compose_strings
      newTextBuffer.write(' ' +
          (newTextLength == 4
              ? ''
              : newValue.text.substring(usedSubstringIndex,
                  usedSubstringIndex = min(newTextLength, 7))));
      if (newValue.selection.end >= 4) selectionIndex++;
    }
    if (newTextLength >= 7) {
      // ignore: prefer_interpolation_to_compose_strings
      newTextBuffer.write(' ' +
          (newTextLength == 7
              ? ''
              : newValue.text.substring(usedSubstringIndex,
                  usedSubstringIndex = min(newTextLength, 9))));
      if (newValue.selection.end >= 7) selectionIndex++;
    }
    if (newTextLength >= 9) {
      // ignore: prefer_interpolation_to_compose_strings
      newTextBuffer.write(' ' +
          (newTextLength == 9
              ? ''
              : newValue.text.substring(usedSubstringIndex,
                  usedSubstringIndex = min(newTextLength, 11))));
      if (newValue.selection.end >= 7) selectionIndex++;
    }
    final newText = newTextBuffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: min(selectionIndex, 16)),
    );
  }
}
