import 'package:common/common.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.title,
    required this.message,
    this.showCancelButton = true,
  });

  final String title;
  final String message;
  final bool showCancelButton;

  Future<void> show(BuildContext context) async {
    await Navigator.push(
      context,
      HeroDialogRoute(
        builder: (context) {
          return Hero(tag: 'warning', child: this);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ).reverseMerge(context.textTheme.displayMedium),
      content: Text(
        message,
        style: context.textTheme.displayMedium,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.yellow,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: const EdgeInsets.only(top: 80, left: 80, right: 80),
      contentPadding: const EdgeInsets.only(left: 80, right: 80, bottom: 60),
      backgroundColor: AppColors.red,
      actions: [
        if (showCancelButton)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Свернуть',
              style: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
      ],
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String? get barrierLabel => 'Warning';
}
