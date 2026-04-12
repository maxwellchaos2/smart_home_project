import 'package:auth/src/application/application.dart';
import 'package:common/common.dart';

class UsernameField extends StatefulWidget {
  const UsernameField({
    super.key,
    required SignInValidationController validationController,
    required TextEditingController controller,
  })  : _validationController = validationController,
        _controller = controller;

  final SignInValidationController _validationController;
  final TextEditingController _controller;

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormValidationField(
      validationController: widget._validationController,
      validationField: widget._validationController.nameField,
      controller: widget._controller,
      keyboardType: TextInputType.name,
      autofillHints: const [
        AutofillHints.username,
      ],
      decoration: InputDecoration(
        hintText: 'Имя пользователя',
      ),
    );
  }
}
