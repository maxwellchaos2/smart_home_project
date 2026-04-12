import 'package:flutter/material.dart';

extension TextEditingControllerEx on TextEditingController {
  String? get textOrNull => text.isEmpty ? null : text.trim();

  void setValueFromText(String text) {
    value = TextEditingValue(
      text: text.toString(),
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }

  num? get numOrNull {
    final text = textOrNull;
    if (text == null) return null;
    return num.tryParse(text);
  }
}
