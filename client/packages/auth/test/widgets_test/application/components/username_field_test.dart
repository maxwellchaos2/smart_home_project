import 'package:auth/src/application/application.dart';
import 'package:auth/src/application/components/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

/// Мокаем контроллер валидации
@GenerateNiceMocks([
  MockSpec<SignInValidationController>(),
])
import 'username_field_test.mocks.dart';

void main() {
  group('UsernameField', () {
    testWidgets('UsernameField корректно отображается',
        (WidgetTester tester) async {
      final mockController = MockSignInValidationController();
      final textEditingController = TextEditingController();

      // Создаем виджет UsernameField с моками
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: UsernameField(
            validationController: mockController,
            controller: textEditingController,
          ),
        ),
      ));

      // Проверяем, что виджет UsernameField отображается
      expect(find.byType(UsernameField), findsOneWidget);
      // Проверяем, что виджет TextFormField с контроллером присутствует
      expect(
          find.byWidgetPredicate((widget) =>
              widget is TextFormField &&
              widget.controller == textEditingController),
          findsOneWidget);
    });
  });
}
