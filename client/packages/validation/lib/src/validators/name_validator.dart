part of 'validator.dart';

final class NameValidationFailure extends ValidationFailure {
  NameValidationFailure() : super("Должно быть больше 2 символов");
}

final class NameValidator extends Validator<String> {
  @override
  ValidationFailure? validate(String value) {
    if (value.trim().length >= 2) {
      return null;
    }
    return NameValidationFailure();
  }
}
