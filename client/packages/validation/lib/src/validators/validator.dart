import '../controllers/validation_controller.dart';

part 'confirm_password_validator.dart';
part 'name_validator.dart';
part 'not_null_validator.dart';
part 'password_validator.dart';
part 'phone_validator.dart';
part 'required_validator.dart';
part 'email_validator.dart';

abstract base class Validator<T> {
  ValidationFailure? validate(T value);
}

base class ValidationFailure {
  final String message;

  const ValidationFailure(this.message);

  const factory ValidationFailure.requiredField([String message]) =
      _RequiredValidationFailure;
}

final class _RequiredValidationFailure extends ValidationFailure {
  const _RequiredValidationFailure([String message = 'Обязательное поле'])
      : super(message);
}
