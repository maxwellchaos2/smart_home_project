part of 'validator.dart';

final class PhoneValidationFailure extends ValidationFailure {
  PhoneValidationFailure() : super("Некорректный номер телефона");
}

final class PhoneValidator extends Validator<String> {
  @override
  ValidationFailure? validate(String value) {
    if (RegExp(r'\d').allMatches(value.trim()).length == 11) {
      return null;
    }
    return PhoneValidationFailure();
  }
}
