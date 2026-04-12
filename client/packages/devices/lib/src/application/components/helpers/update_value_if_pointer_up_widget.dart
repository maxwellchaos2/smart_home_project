import 'package:common/common.dart';

class UpdateValueIfPointerUpWidget<T> extends StatefulWidget {
  const UpdateValueIfPointerUpWidget({
    super.key,
    required this.value,
    required this.onNeedUpdate,
    required this.builder,
  });

  final T value;
  final void Function(T value) onNeedUpdate;
  final Widget Function(
      BuildContext context, T value, void Function(T) setValue) builder;

  @override
  State<UpdateValueIfPointerUpWidget<T>> createState() =>
      _UpdateValueIfPointerUpWidgetState<T>();
}

class _UpdateValueIfPointerUpWidgetState<T>
    extends State<UpdateValueIfPointerUpWidget<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant UpdateValueIfPointerUpWidget<T> oldWidget) {
    if (oldWidget.value != widget.value) {
      setState(() {
        _value = widget.value;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _setValue(T value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerUp: (event) async {
        await Future.delayed(Duration.zero);
        if (widget.value != _value) {
          widget.onNeedUpdate(_value);
        }
      },
      child: widget.builder(context, _value, _setValue),
    );
  }
}
