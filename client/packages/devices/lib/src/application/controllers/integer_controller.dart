import 'package:common/common.dart';

abstract class IntegerController with ChangeNotifier {
  int _value;

  final int? minValue;
  final int? maxValue;

  dynamic _eventType;

  IntegerController({
    required int value,
    this.minValue,
    this.maxValue,
  }) : _value = value;

  int get value => _value;

  dynamic get eventType => _eventType;

  void setValue(int value, {dynamic eventType}) {
    _value = value;
    _eventType = eventType;
    notifyListeners();
  }

  void increment({dynamic eventType}) {
    if (maxValue != null && _value >= maxValue!) return;
    _value++;
    _eventType = eventType;
    notifyListeners();
  }

  void decrement({dynamic eventType}) {
    if (minValue != null && _value <= minValue!) return;
    _value--;
    _eventType = eventType;
    notifyListeners();
  }

  @protected
  void setEventType(dynamic eventType) {
    _eventType = eventType;
  }
}
