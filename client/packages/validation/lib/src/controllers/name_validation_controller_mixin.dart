import '../validators/validator.dart';
import 'validation_controller.dart';

mixin NameValidationControllerMixin on ValidationController {
  final ValidationField<String> _nameField =
      ValidationField(validator: RequiredValidator(), value: '');

  ValidationField<String> get nameField => _nameField;

  @override
  List<ValidationField> get validationsfields =>
      [_nameField, ...super.validationsfields];
}
