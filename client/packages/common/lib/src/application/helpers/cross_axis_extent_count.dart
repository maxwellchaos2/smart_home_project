import 'dart:math' as math;

final class CrossAxisExtentCount {
  final double extent;
  final int count;

  const CrossAxisExtentCount({
    required this.extent,
    required this.count,
  });

  factory CrossAxisExtentCount.horizontal({
    required double crossAxisExtent,
    required double maxCrossAxisExtent,
    required double crossAxisSpacing,
  }) {
    int crossAxisCount =
        (crossAxisExtent / (maxCrossAxisExtent + crossAxisSpacing)).ceil();
    // Ensure a minimum count of 1, can be zero and result in an infinite extent
    // below when the window size is 0.
    crossAxisCount = math.max(1, crossAxisCount);
    final double usableCrossAxisExtent = math.max(
      0.0,
      crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    return CrossAxisExtentCount(
      count: crossAxisCount,
      extent: childCrossAxisExtent,
    );
  }
}
