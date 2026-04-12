import 'package:common/common.dart';

final class WarningController extends ChangeNotifier {
  WarningMessage? _message;

  WarningMessage? get message => _message;

  bool get hasWarning => _message != null;

  void setMessage(WarningMessage message) {
    _message = message;
    notifyListeners();
  }

  void clearMessage() {
    _message = null;
    notifyListeners();
  }
}

typedef WarningMessage = ({
  String title,
  String message,
});
