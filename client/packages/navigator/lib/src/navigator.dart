import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:common/common.dart';

export 'app_navigator_controller.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    required this.controller,
    this.onDeepLinkOpened,
    super.key,
  });

  final AppNavigatorController controller;
  final void Function(Uri uri)? onDeepLinkOpened;

  static AppNavigatorController of(BuildContext context,
          {bool listen = false}) =>
      Provider.of<AppNavigatorController>(context, listen: listen);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  late final StreamSubscription<Uri> _subAppLinks;

  @override
  void initState() {
    super.initState();
    _subAppLinks = AppLinks().uriLinkStream.listen((uri) {
      widget.onDeepLinkOpened?.call(uri);
    });
  }

  @override
  void dispose() {
    _subAppLinks.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return NavigatorPopHandler(
            onPopWithResult: widget.controller.navigatorKey.currentState?.pop,
            child: Navigator(
              key: widget.controller.navigatorKey,
              pages: widget.controller.pages,
              observers: [],
              // ignore: invalid_use_of_visible_for_testing_member
              onDidRemovePage: widget.controller.onDidRemovePage,
            ),
          );
        },
      ),
    );
  }
}

extension NavigatorEx on BuildContext {
  AppNavigatorController get navigator => AppNavigator.of(this, listen: false);
}

mixin ScreenMixin on Widget {
  Page<Object?> get page => MaterialPage(
        key: ValueKey(this),
        child: this is ScreenWrapper
            ? WrappedScreen(child: this as ScreenWrapper)
            : this,
      );
}

abstract class ScreenWrapper {
  Widget wrappedScreen(BuildContext context);
}

class WrappedScreen<T extends ScreenWrapper> extends StatelessWidget {
  /// default constructor
  const WrappedScreen({super.key, required this.child});

  /// The widget that implements [ScreenWrapper]
  final T child;

  @override
  Widget build(BuildContext context) {
    return child.wrappedScreen(context);
  }
}
