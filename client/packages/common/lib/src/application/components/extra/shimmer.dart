import 'package:common/common.dart';
import 'package:shimmer/shimmer.dart' as s;

final class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.enabled = true,
  });

  const Shimmer.expand({
    super.key,
    this.enabled = true,
  }) : child = const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        );

  Shimmer.text({
    super.key,
    TextStyle? textStyle,
    int lines = 1,
    double width = double.infinity,
    this.enabled = true,
    double? endSpacing,
  }) : child = _TextShimmerPlaceholder(
          textStyle,
          lines: lines,
          width: width,
          endSpacing: endSpacing,
        );

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return s.Shimmer.fromColors(
      baseColor: const Color.fromARGB(157, 221, 221, 221),
      highlightColor: const Color.fromARGB(147, 188, 188, 188),
      enabled: enabled,
      child: child,
    );
  }
}

final class _TextShimmerPlaceholder extends StatelessWidget {
  const _TextShimmerPlaceholder(
    this.textStyle, {
    this.lines = 1,
    this.width = double.infinity,
    this.endSpacing,
  });

  final TextStyle? textStyle;
  final int lines;
  final double width;
  final double? endSpacing;

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    final textRow = Container(
      width: width,
      height: textStyle.fontSize! * (textStyle.height ?? 1.2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
    if (lines == 1) {
      return textRow;
    }
    return Wrap(
      runSpacing: 5,
      children: [
        for (final line in List.generate(lines, (index) => index + 1))
          Padding(
            padding: lines == line && endSpacing != null
                ? EdgeInsets.only(right: endSpacing!)
                : EdgeInsets.zero,
            child: textRow,
          ),
        if (endSpacing != null) SizedBox(width: endSpacing),
      ],
    );
  }
}
