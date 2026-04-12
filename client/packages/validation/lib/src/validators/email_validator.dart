part of 'validator.dart';

final class EmailValidationFailure extends ValidationFailure {
  EmailValidationFailure() : super("Неверный формат email");
}

final class EmailValidator extends Validator<String> {
  @override
  ValidationFailure? validate(String value) {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return null;
    }
    return PhoneValidationFailure();
  }
}
