import 'package:common/common.dart';

final class VentilationController extends TabController {
  bool _isEnabled;

  VentilationController({
    required bool enabled,
    required VentilationMode mode,
    required super.vsync,
  })  : _isEnabled = enabled,
        super(
          length: VentilationMode.values.length,
          initialIndex: VentilationMode.values.indexOf(mode),
        );

  bool get isEnabled => _isEnabled;

  VentilationMode get mode => VentilationMode.values[index];

  void setIsEnabled(bool enabled) {
    _isEnabled = enabled;
    notifyListeners();
  }
}

enum VentilationMode {
  fast,
  medium,
  slow,
}
