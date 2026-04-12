import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:sleek_circular_slider/src/utils.dart';

class DashesPainter extends CustomPainter {
  final Color? dashColor;
  final Color? valueColor;
  final CircularSliderAppearance appearance;
  final double minValue;
  final double maxValue;

  DashesPainter({
    required this.appearance,
    this.dashColor,
    this.valueColor,
    required this.minValue,
    required this.maxValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final widgetSize = appearance.size;
    final double padding = widgetSize / 20;
    final center = Offset(size.width / 2, size.height / 2);
    const valueDashLength = 5;
    // final minuteDashLength = clockSize / 30;

    final radius =
        math.min(size.width / 2, size.height / 2) + appearance.progressBarWidth;

    final dashPaint = Paint()
      ..color = dashColor ?? Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    bool isTwo = false;
    for (final i
        in List.generate((maxValue - minValue).toInt() + 1, (index) => index)) {
      final angle = degreeToRadians(appearance.startAngle) +
          degreeToRadians(appearance.angleRange) * (i / (maxValue - minValue));
      final valueDashLength0 = isTwo ? valueDashLength : valueDashLength * 1.5;
      final startX =
          center.dx + (radius - padding + valueDashLength0 * 1.5) * cos(angle);
      final startY =
          center.dy + (radius - padding + valueDashLength0 * 1.5) * sin(angle);
      final endX = center.dx + (radius - valueDashLength * 1.5) * cos(angle);
      final endY = center.dy + (radius - valueDashLength * 1.5) * sin(angle);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), dashPaint);
      isTwo = !isTwo;
    }

    // Draw numbers
    for (final i
        in List.generate((maxValue - minValue).toInt() + 1, (index) => index)) {
      if (i % 2 != 0) continue;
      final angle = degreeToRadians(appearance.startAngle) +
          degreeToRadians(appearance.angleRange) * (i / (maxValue - minValue));
      const valueDashLength0 = valueDashLength * 1.5;
      final numberX = center.dx +
          (radius - padding + 10 + valueDashLength0 * 1.5) * cos(angle);
      final numberY = center.dy +
          (radius - padding + 10 + valueDashLength0 * 1.5) * sin(angle);

      textPainter.text = TextSpan(
        text: (minValue + i).toInt().toString(),
        style: TextStyle(
          fontSize: widgetSize / 16,
          color: valueColor ?? Colors.white,
          fontWeight: FontWeight.w500,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          numberX - textPainter.width / 2,
          numberY - textPainter.height / 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
