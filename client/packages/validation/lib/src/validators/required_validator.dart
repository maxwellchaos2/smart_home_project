part of 'validator.dart';

final class RequiredValidationFailure extends ValidationFailure {
  RequiredValidationFailure() : super("Обязательное поле");
}

final class RequiredValidator extends Validator<String> {
  @override
  ValidationFailure? validate(String value) {
    return value.isEmpty ? RequiredValidationFailure() : null;
  }
}
