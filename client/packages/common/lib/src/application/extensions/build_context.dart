import 'package:common/common.dart';

class MainScaffoldKeyController extends ChangeNotifier {
  MainScaffoldKeyController() : super();

  GlobalKey<ScaffoldState> _value = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get value => _value;

  set value(GlobalKey<ScaffoldState> newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }

  void setNewKeyWithoutUpdate() {
    value = GlobalKey<ScaffoldState>();
  }
}

extension ContextEx on BuildContext {
  AppContext get app => AppContext(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  GetIt get locator => read<GetIt>();
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  GlobalKey<ScaffoldState> get mainScaffoldKey =>
      read<MainScaffoldKeyController>().value;

  BuildContext get rootContext {
    BuildContext context = this;
    while (true) {
      final parent = context.findAncestorStateOfType<NavigatorState>();
      if (parent == null) {
        return context;
      } else {
        context = parent.context;
      }
    }
  }
}

final class AppContext {
  final BuildContext _context;

  const AppContext(this._context);

  Future<T?> showErrorDialog<T>({required String? message}) {
    return showDialog<T>(
      context: _context,
      builder: (context) => ErrorDialog(errorMessage: message),
    );
  }
}
