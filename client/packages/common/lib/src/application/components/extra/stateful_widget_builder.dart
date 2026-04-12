import 'package:common/common.dart';

class StatefulBuilderWidget extends StatefulWidget {
  const StatefulBuilderWidget({
    super.key,
    this.initState,
    this.dispose,
    this.didChangeDependencies,
    this.child,
    required this.builder,
  });

  final void Function(BuildContext context)? initState;
  final void Function(BuildContext context)? dispose;
  final void Function(BuildContext context)? didChangeDependencies;
  final Widget? child;
  final Function(BuildContext context, Widget? child) builder;

  @override
  State<StatefulBuilderWidget> createState() => _StatefulBuilderWidgetState();
}

class _StatefulBuilderWidgetState extends State<StatefulBuilderWidget> {
  @override
  void initState() {
    widget.initState?.call(context);
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose?.call(context);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    widget.didChangeDependencies?.call(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}
