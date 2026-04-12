import 'package:common/common.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.isSelected,
    required this.label,
    this.onSelected,
  });

  final bool isSelected;
  final Widget label;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      side: isSelected
          ? BorderSide(color: context.theme.colorScheme.primary)
          : BorderSide.none,
      labelStyle: TextStyle(color: Colors.white),
      label: label,
      selected: isSelected,
      onSelected: onSelected,
    );
  }
}
