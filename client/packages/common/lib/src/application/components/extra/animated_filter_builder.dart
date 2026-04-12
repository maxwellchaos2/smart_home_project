import 'package:common/common.dart';

class AnimatedFilterBuilder extends StatefulWidget {
  /// Creates a widget that rebuilds when the given listenable changes.
  ///
  /// The [animation] argument is required.
  const AnimatedFilterBuilder({
    super.key,
    required this.animation,
    required this.filter,
    required this.builder,
    this.child,
  });

  /// The [Listenable] to which this widget is listening.
  ///
  /// Commonly an [Animation] or a [ChangeNotifier].
  final Listenable animation;
  final bool Function() filter;
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;

  /// Subclasses typically do not override this method.
  @override
  State<AnimatedFilterBuilder> createState() => _AnimatedState();
}

class _AnimatedState extends State<AnimatedFilterBuilder> {
  @override
  void initState() {
    super.initState();
    widget.animation.addListener(_handleChange);
  }

  @override
  void didUpdateWidget(AnimatedFilterBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animation != oldWidget.animation) {
      oldWidget.animation.removeListener(_handleChange);
      widget.animation.addListener(_handleChange);
    }
  }

  @override
  void dispose() {
    widget.animation.removeListener(_handleChange);
    super.dispose();
  }

  void _handleChange() {
    if (widget.filter()) {
      setState(() {
        // The listenable's state is our build state, and it changed already.
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, widget.child);
}
