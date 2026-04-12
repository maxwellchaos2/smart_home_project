import 'package:auth/src/application/application.dart';
import 'package:auth/src/application/components/password_field.dart';
import 'package:auth/src/application/components/username_field.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';

final class SignInScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const SignInScreen({
    super.key,
    this.validationController,
  });

  final SignInValidationController? validationController;

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        SignInScope(),
      ],
      child: this,
    );
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends StateWithListeners<SignInScreen> {
  late final SignInValidationController _validationController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _validationController =
        widget.validationController ?? SignInValidationController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _validationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_validationController.validateAll()) {
      SignInScope.of(context).signIn(
        data: SignInInputEntity(
          username: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  List<SingleChildWidget> get listeners => [
        SignInBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) => context.app.showErrorDialog(
              message: state.failure.message,
            ),
            success: (state) {
              return context.navigator.replaceRoute(
                '/splash',
              );
            },
          ),
        ),
      ];

  @override
  Widget buildChild(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.surface,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: AnimatedBuilder(
                  animation: _validationController,
                  builder: (context, child) {
                    return ListView(
                      padding: AppPaddings.horizontal,
                      children: [
                        const SizedBox(height: 50),
                        Center(
                          child: Text(
                            'Вход',
                            style: context.textTheme.headlineSmall,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Username *'),
                        const SizedBox(height: 5),
                        UsernameField(
                          controller: _usernameController,
                          validationController: _validationController,
                        ),
                        const SizedBox(height: 16),
                        const Text('Пароль *'),
                        const SizedBox(height: 5),
                        PasswordField(
                          validationController: _validationController,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 30),
                        Builder(
                          builder: (context) {
                            final state =
                                SignInScope.of(context, listen: true).state;
                            return AppFormButton.primary(
                              key: const Key('sign_in_button'),
                              onPressed: _validationController.hasErrors
                                  ? null
                                  : _submit,
                              isLoading: state.isLoading,
                              child: const Text('Войти'),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
