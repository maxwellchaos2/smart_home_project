import 'package:common/common.dart';

abstract class AppModalBottomSheet<T> extends StatelessWidget {
  const AppModalBottomSheet({
    super.key,
    this.padding = AppPaddings.horizontal,
    this.isScrollControlled = true,
    this.paddingFromTop = 20,
    this.bottomSafeArea = true,
  });

  final EdgeInsetsGeometry padding;
  final bool isScrollControlled;
  final double paddingFromTop;
  final bool bottomSafeArea;

  Future<T?> show(BuildContext context) async {
    Widget child = this;
    if (this is ModalBottomSheetWrapper) {
      child = (this as ModalBottomSheetWrapper).wrappedWidget(context);
    }

    return showModalBottomSheet<T>(
      context: context,
      elevation: 10,
      barrierColor: AppColors.black.withOpacity(.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      isScrollControlled: isScrollControlled,
      builder: (context) => child,
    );
  }

  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: bottomSafeArea,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: padding,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 30,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: AppColors.grey30,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                SizedBox(height: paddingFromTop),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: buildChild(context),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract interface class ModalBottomSheetWrapper {
  Widget wrappedWidget(BuildContext context);
}
