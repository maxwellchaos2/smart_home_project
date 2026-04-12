part of 'validator.dart';

final class PasswordValidationFailure extends ValidationFailure {
  PasswordValidationFailure({
    String name = "Пароль должен содержать латинские буквы и цифры.",
  }) : super(name);
}

final class PasswordValidator extends Validator<String> {
  @override
  ValidationFailure? validate(String value) {
    if (value.length < 6) {
      return PasswordValidationFailure(
          name: 'Пароль должен содержать минимум 6 символов');
    }
    if (RegExp(r'^(?=.*[a-z])(?=.*?[0-9]).*', caseSensitive: false)
        .hasMatch(value.trim())) {
      return null;
    }
    return PasswordValidationFailure();
  }
}
