import 'package:common/common.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isActive = false,
    this.padding = const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 25,
    ),
    this.minimumSize = const Size(100, 82),
  });

  final void Function() onPressed;
  final Widget child;
  final bool isActive;
  final EdgeInsets padding;
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6F6F6F),
        foregroundColor: Colors.white,
        padding: padding,
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isActive
              ? BorderSide(
                  color: context.theme.primaryColor,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
