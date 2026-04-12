import 'controllers.dart';

final class TemperatureController extends IntegerController {
  TemperatureController({
    required super.value,
  }) : super(
          minValue: 16,
          maxValue: 32,
        );
}
