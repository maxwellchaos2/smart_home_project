import '../validators/validator.dart';
import 'validation_controller.dart';

mixin PasswordValidationControllerMixin on ValidationController {
  final ValidationField<String> _passwordField =
      ValidationField(validator: RequiredValidator(), value: '');

  ValidationField<String> get passwordField => _passwordField;

  @override
  List<ValidationField> get validationsfields =>
      [_passwordField, ...super.validationsfields];
}
