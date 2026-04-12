import 'package:auth/src/application/application.dart';
import 'package:common/common.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required SignInValidationController validationController,
    required TextEditingController controller,
  })  : _validationController = validationController,
        _controller = controller;

  final SignInValidationController _validationController;
  final TextEditingController _controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormValidationField(
      validationController: widget._validationController,
      validationField: widget._validationController.passwordField,
      controller: widget._controller,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [
        AutofillHints.password,
      ],
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.grey90,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}
