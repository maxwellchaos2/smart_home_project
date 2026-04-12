import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

abstract final class AppInputDecorationTheme {
  static final InputDecorationTheme dark = InputDecorationTheme(
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border.copyWith(
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 157, 157, 157),
      ),
    ),
    errorBorder: _border.copyWith(
      borderSide: const BorderSide(
        color: Colors.redAccent,
      ),
    ),
    focusedErrorBorder: _border.copyWith(
      borderSide: const BorderSide(
        color: Colors.redAccent,
      ),
    ),
    hintStyle: const TextStyle(
      color: Color(0xFF757575),
      fontSize: 14,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 11,
      vertical: 14,
    ),
  );

  static final InputBorder _border = DecoratedInputBorder(
    shadow: const BoxShadow(
      color: Color.fromARGB(51, 0, 0, 0),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    child: OutlineInputBorder(
      borderSide: const BorderSide(
        width: .1,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color.fromARGB(255, 40, 40, 40),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'DecoratedInputBorder')}($borderSide, $shadow, $child)';
  }
}
