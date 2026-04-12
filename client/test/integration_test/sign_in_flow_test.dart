import 'package:client/main.dart';
import 'package:client/src/app_builder.dart';
import 'package:client/src/app_config.dart';
import 'package:client/src/main_app_runner.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (
      tester,
    ) async {
      final appConfig = switch (const String.fromEnvironment('ENV')) {
        'dev' => DevAppConfig(),
        _ => ProdAppConfig(),
      };
      final runner = AppRunner(locator: GetIt(), appConfig: appConfig);
      final builder = AppBuilder(
        appConfig: appConfig,
        navigatorController: getNavigatorController(),
      );

      await runner.preloadData();

      // Load app widget.
      await tester.pumpWidget(LocatorScope(
        create: (context) => runner.locator,
        child: builder.buildApp(),
      ));

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final fab = find.byKey(const ValueKey('increment'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });
}
