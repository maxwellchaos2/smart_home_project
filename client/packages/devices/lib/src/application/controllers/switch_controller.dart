import 'package:common/common.dart';

abstract final class SwitchController with ChangeNotifier {
  bool _value;

  SwitchController({
    required bool value,
  }) : _value = value;

  bool get value => _value;

  void setValue(bool value) {
    _value = value;
    notifyListeners();
  }
}

final class ExhaustFanKitchenController = SwitchController with Z;
final class ExhaustFanBathroomController = SwitchController with Z;
final class DoorController = SwitchController with Z;
final class FloorController = SwitchController with Z;
final class BatteriesController = SwitchController with Z;

mixin Z {}
