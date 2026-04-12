import 'package:app_links/app_links.dart';
import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

abstract class AppNavigatorController implements ChangeNotifier {
  factory AppNavigatorController({
    required List<Page<Object?>> initialPages,
  }) = AppNavigatorControllerImpl;

  GlobalKey<NavigatorState> get navigatorKey;

  bool get canPop;

  void change(List<Page<Object?>> Function(List<Page<Object?>>) fn);
  void push(Page<Object?> page);
  void popForced<T extends Object?>([T? result]);
  void replace(Page<Object?> page);
  void onDidRemovePage(Page<Object?> route);
  List<Page<Object?>> get pages;

  void registerRoute(String route, Page<Object?> Function() pageBuilder);
  void pushRoute(String route);
  void replaceRoute(String route);

  Future<Uri?> getInitialDeepLink();
}

class AppNavigatorControllerImpl
    with ChangeNotifier, AppNavigatorControllerRouterMixin
    implements AppNavigatorController {
  late final GlobalKey<NavigatorState> _navigatorKey;

  List<Page<Object?>> _pages = [];

  AppNavigatorControllerImpl({required List<Page<Object?>> initialPages}) {
    _pages.addAll(initialPages);
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  bool get canPop => _pages.length > 1;

  @override
  void change(List<Page<Object?>> Function(List<Page<Object?>>) fn) {
    final newPages = fn(_pages);
    if (identical(newPages, _pages)) return;
    if (listEquals(newPages, _pages)) return;
    _pages = newPages;
    notifyListeners();
  }

  @override
  void push(Page<Object?> page) async {
    change((pages) => List.of(pages)..add(page));
  }

  @override
  void popForced<T extends Object?>([T? result]) {
    _navigatorKey.currentState!.pop(result);
  }

  @override
  void replace(Page<Object?> page) {
    change((pages) {
      final newPages = List.of(pages);
      newPages.removeLast();
      newPages.add(page);
      return newPages;
    });
  }

  @override
  @visibleForTesting
  void onDidRemovePage(Page<Object?> route) {
    if (_pages.length <= 1) return;
    if (_pages.last != route) return;
    change(
      (pages) {
        return List.of(pages)..removeLast();
      },
    );
  }

  @override
  List<Page<Object?>> get pages => _pages.toList(growable: false);

  @override
  Future<Uri?> getInitialDeepLink() async {
    return AppLinks().getInitialLink();
  }
}

mixin AppNavigatorControllerRouterMixin implements AppNavigatorController {
  final Map<String, Page<Object?> Function()> _routes = {};

  @override
  void registerRoute(String route, Page<Object?> Function() pageBuilder) {
    _routes[route] = pageBuilder;
  }

  @override
  void pushRoute(String route) {
    final pageBuilder = _routes[route];
    if (pageBuilder == null) {
      throw Exception('Route $route not found');
    }
    push(pageBuilder());
  }

  @override
  void replaceRoute(String route) {
    final pageBuilder = _routes[route];
    if (pageBuilder == null) {
      throw Exception('Route $route not found');
    }
    replace(pageBuilder());
  }
}
