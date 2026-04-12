import 'package:auth/src/application/application.dart';
import 'package:auth/src/application/components/components.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart'
    show anyNamed, provideDummy, verify, verifyNever;

/// Мокаем контроллер валидации
@GenerateNiceMocks([
  MockSpec<SignInValidationController>(),
  MockSpec<ISignInController>(),
  MockSpec<IAuthTokenRepository>()
])
import 'sign_in_screen_test.mocks.dart';

class FakeSignInState extends Fake implements SignInState {}

void main() {
  group('SignInScreen', () {
    testWidgets('UsernameField и PasswordField корректно отображаются',
        (WidgetTester tester) async {
      // Создаем виджет UsernameField с моками
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          return SignInScreen().wrappedScreen(context);
        }),
      ));

      // Проверяем, что виджет UsernameField отображается
      expect(find.byType(UsernameField), findsOneWidget);
      // Проверяем, что виджет UsernameField отображается
      expect(find.byType(PasswordField), findsOneWidget);
    });

    testWidgets('После нажатия на кнопку валидируются данные',
        (WidgetTester tester) async {
      final mockValidationController = MockSignInValidationController();
      final mockSignInController = MockISignInController();
      final mockAuthRepository = MockIAuthTokenRepository();

      provideDummy<SignInState>(SignInState.initial());

      // Создаем виджет UsernameField с моками
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          return Provider.value(
            value: SignInBloc(repository: mockAuthRepository),
            child: Provider<ISignInController>.value(
              value: mockSignInController,
              child: SignInScreen(
                validationController: mockValidationController,
              ),
            ),
          );
        }),
      ));

      // Ищем кнопку "Войти"
      final signInButton = find.byKey(const Key('sign_in_button'));

      // Проверяем, что кнопка "Войти" отображается
      expect(signInButton, findsOneWidget);
      // Нажимаем на кнопку "Войти"
      await tester.tap(signInButton);
      await tester.pumpAndSettle();
      // Проверяем, что метод validateAll() был вызван
      verify(mockValidationController.validateAll()).called(1);
      // Проверяем, что метод signIn() не был вызван
      verifyNever(
        mockSignInController.signIn(
          data: anyNamed('data'),
        ),
      );
    });

    testWidgets('После успешной валидации вызывается метод signIn',
        (WidgetTester tester) async {
      final mockSignInController = MockISignInController();
      final mockAuthRepository = MockIAuthTokenRepository();

      provideDummy<SignInState>(SignInState.initial());

      // Создаем виджет UsernameField с моками
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          return Provider.value(
            value: SignInBloc(repository: mockAuthRepository),
            child: Provider<ISignInController>.value(
              value: mockSignInController,
              child: SignInScreen(),
            ),
          );
        }),
      ));

      // Ищем кнопку "Войти"
      final signInButton = find.byKey(const Key('sign_in_button'));

      // Заполняем поля ввода
      final usernameField = find.descendant(
        of: find.byType(UsernameField),
        matching: find.byType(TextField),
      );
      final passwordField = find.descendant(
        of: find.byType(PasswordField),
        matching: find.byType(TextField),
      );

      await tester.enterText(usernameField, 'username');
      await tester.enterText(passwordField, 'password');
      await tester.pumpAndSettle();

      // Проверяем, что кнопка "Войти" отображается
      expect(signInButton, findsOneWidget);
      // Нажимаем на кнопку "Войти"
      await tester.tap(signInButton);
      await tester.pumpAndSettle();
      // Проверяем, что метод signIn() был вызван
      verify(
        mockSignInController.signIn(
          data: SignInInputEntity(
            username: 'username',
            password: 'password',
          ),
        ),
      ).called(1);
    });
  });
}
