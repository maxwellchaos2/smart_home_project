import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

final class FocusWatcher extends StatefulWidget {
  const FocusWatcher({required this.child, super.key});

  final Widget child;

  @override
  FocusWatcherState createState() => FocusWatcherState();
}

class FocusWatcherState extends State<FocusWatcher> {
  bool _onPointerDownIsIgnore = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext c, BoxConstraints viewportConstraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: viewportConstraints.maxWidth,
            maxHeight: viewportConstraints.maxHeight),
        child: Listener(
          onPointerDown: (e) {
            _onPointerDownIsIgnore = true;
            var rb = context.findRenderObject() as RenderBox;
            var result = BoxHitTestResult();
            rb.hitTest(result, position: rb.globalToLocal(e.position));

            // if there any widget in the path that must ignore taps,
            // stop it right here
            if (result.path.any((entry) =>
                entry.target.runtimeType == FocusWatcherIgnoreRenderBox)) {
              return;
            }
            var isEditable = result.path.any((entry) =>
                entry.target.runtimeType == RenderEditable ||
                entry.target.runtimeType == FocusWatcherForceRenderBox);

            var currentFocus = FocusScope.of(context);
            if (!isEditable) {
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
                _onPointerDownIsIgnore = false;
              }
            }
          },
          onPointerUp: (e) {
            var rb = context.findRenderObject() as RenderBox;
            var result = BoxHitTestResult();
            rb.hitTest(result, position: rb.globalToLocal(e.position));

            // if there any widget in the path that must ignore taps,
            // stop it right here
            if (result.path.any((entry) =>
                entry.target.runtimeType == FocusWatcherIgnoreRenderBox)) {
              return;
            }
            var isEditable = result.path.any((entry) =>
                entry.target.runtimeType == RenderEditable ||
                entry.target.runtimeType == FocusWatcherForceRenderBox);

            var currentFocus = FocusScope.of(context);
            if (!isEditable) {
              if (!currentFocus.hasPrimaryFocus && !_onPointerDownIsIgnore) {
                currentFocus.unfocus();
              }
            }
          },
          child: widget.child,
        ),
      );
    });
  }
}

class IgnoreFocusWatcher extends SingleChildRenderObjectWidget {
  const IgnoreFocusWatcher({
    super.key,
    required super.child,
  });

  @override
  FocusWatcherIgnoreRenderBox createRenderObject(
    BuildContext context,
  ) {
    return FocusWatcherIgnoreRenderBox();
  }
}

// if you want to force focus on some widget, wrap it with this one
class ForceFocusWatcher extends SingleChildRenderObjectWidget {
  const ForceFocusWatcher({super.key, required super.child});

  @override
  FocusWatcherForceRenderBox createRenderObject(BuildContext context) {
    return FocusWatcherForceRenderBox();
  }
}

class FocusWatcherIgnoreRenderBox extends RenderPointerListener {}

class FocusWatcherForceRenderBox extends RenderPointerListener {}
