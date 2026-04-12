import 'package:flutter/material.dart';

extension TextStyleEx on TextStyle {
  /// call [merge] for [other] style with this style
  TextStyle reverseMerge(TextStyle? other) {
    if (other == null) {
      return this;
    }
    return other.merge(this);
  }
}
