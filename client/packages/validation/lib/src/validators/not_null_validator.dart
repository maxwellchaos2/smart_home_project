part of 'validator.dart';

final class NotNullValidationFailure extends ValidationFailure {
  NotNullValidationFailure() : super("Обязательное поле");
}

final class NotNullValidator<T> extends Validator<T> {
  @override
  ValidationFailure? validate(T value) {
    return value == null ? NotNullValidationFailure() : null;
  }
}
