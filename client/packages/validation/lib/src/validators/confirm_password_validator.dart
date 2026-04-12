part of 'validator.dart';

final class ConfirmPasswordValidationFailure extends ValidationFailure {
  ConfirmPasswordValidationFailure({
    String name = "Пароли не совпадают.",
  }) : super(name);
}

final class ConfirmPasswordValidator extends Validator<String> {
  final ValidationField<String> Function() _getPasswordField;

  ConfirmPasswordValidator(
      {required ValidationField<String> Function() getPasswordField})
      : _getPasswordField = getPasswordField;

  @override
  ValidationFailure? validate(String value) {
    if (_getPasswordField().value.trim() == value.trim()) {
      return null;
    }
    return ConfirmPasswordValidationFailure();
  }
}
