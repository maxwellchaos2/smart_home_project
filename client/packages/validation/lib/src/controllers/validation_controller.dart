import 'package:flutter/material.dart';

import '../validators/validator.dart';

export 'name_validation_controller_mixin.dart';
export 'password_validation_controller_mixin.dart';

abstract class ValidationController with ChangeNotifier {
  ValidationController();
  List<ValidationField> get validationsfields => [];

  final Set<ValidationField> _fieldsWithVisibleError = {};

  bool get hasVisibleError =>
      _fieldsWithVisibleError.where((field) => field.error != null).isNotEmpty;

  String? getFieldVisibleError(ValidationField field) {
    return _fieldsWithVisibleError.contains(field) ? field.error : null;
  }

  bool addFieldWithVisibleError(ValidationField field) {
    notifyListeners();
    return _fieldsWithVisibleError.add(field);
  }

  bool validateField<T>(ValidationField<T> field, T newValue) {
    field.validate(newValue);
    notifyListeners();
    return field.hasError;
  }

  bool validateAll() {
    for (final field in validationsfields) {
      field.validate(field.value);
    }
    _fieldsWithVisibleError.addAll(validationsfields);
    notifyListeners();
    return !hasErrors;
  }

  bool get hasErrors {
    for (final field in validationsfields) {
      if (field.hasError) {
        return true;
      }
    }
    return false;
  }
}

class ValidationField<T> {
  ValidationField({
    required Validator<T> validator,
    required this.value,
    this.error,
  }) : _validator = validator;

  T value;
  String? error;
  final Validator<T> _validator;

  bool get hasError => error != null;

  String? validate(T newValue) {
    value = newValue;
    error = _validator.validate(newValue)?.message;
    return error;
  }
}
