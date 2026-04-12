import 'package:common/common.dart';

abstract class StateWithListeners<T extends StatefulWidget> extends State<T> {
  List<SingleChildWidget> get listeners;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: listeners, child: buildChild(context));
  }

  @protected
  @visibleForOverriding
  Widget buildChild(BuildContext context);
}
