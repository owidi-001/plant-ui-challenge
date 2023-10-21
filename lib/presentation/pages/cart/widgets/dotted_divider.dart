import 'package:flutter/material.dart';

class DottedLineDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashSpace;

  DottedLineDivider({
    this.height = 1,
    this.color = Colors.grey,
    this.thickness = 1,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: DottedLinePainter(
        color: color,
        thickness: thickness,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashSpace;

  DottedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double totalDashSpace = dashSpace + dashWidth;
    final double dashCount = size.width / totalDashSpace;

    for (var i = 0; i < dashCount; i++) {
      final double startX = i * totalDashSpace;
      final double endX = startX + dashWidth;
      canvas.drawLine(Offset(startX, size.height / 2), Offset(endX, size.height / 2), paint);
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.thickness != thickness ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}