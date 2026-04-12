import 'package:auth/src/application/application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInValidationController', () {
    late SignInValidationController controller;

    setUp(() {
      controller = SignInValidationController();
    });

    test('Начальное состояние полей не содержит ошибок', () {
      expect(controller.nameField.error, isNull);
      expect(controller.passwordField.error, isNull);
    });

    test('Проверка валидации имени', () {
      // Передаем пустое значение – должна быть ошибка
      controller.validateField(controller.nameField, '');
      expect(controller.nameField.error, isNotNull);

      // Передаем корректное имя
      controller.validateField(controller.nameField, 'Алиса');
      expect(controller.nameField.error, isNull);
    });

    test('Проверка валидации пароля', () {
      // Пароль пустой – ошибка
      controller.validateField(controller.passwordField, '');
      expect(controller.passwordField.error, isNotNull);

      // Корректный пароль: больше 1 символа
      controller.validateField(controller.passwordField, 'abc123');
      expect(controller.passwordField.error, isNull);
    });

    test('Валидация всех полей', () {
      // Невалидное имя
      controller.validateField(controller.nameField, '');
      controller.validateField(controller.passwordField, 'abc123');

      expect(controller.validateAll(), isFalse);

      // Устанавливаем корректное имя и повторно проверяем
      controller.validateField(controller.nameField, 'Боб');
      expect(controller.validateAll(), isTrue);
    });
  });
}
