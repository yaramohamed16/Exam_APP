import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScoreCircle extends StatelessWidget {
  final int score;

  const ScoreCircle({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (score >= 80) {
      color = Colors.green.shade800;
    } else if (score >= 60) {
      color = Colors.yellow.shade600;
    } else {
      color = Colors.red.shade800;
    }

    return CustomPaint(
      size: const Size(300, 300),
      painter: ScoreCirclePainter(score: score, color: color),
    );
  }
}

class ScoreCirclePainter extends CustomPainter {
  final int score;
  final Color color;

  ScoreCirclePainter({required this.score, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.width / 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint greyPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = size.width / 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius =
        math.min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;

    double totalAngle = math.pi * 1.0; // 90 degrees clockwise from the top
    double sweepAngle = (score / 100) * totalAngle;

    // Draw grey arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi + sweepAngle,
      totalAngle - sweepAngle,
      false,
      greyPaint,
    );

    // Draw colored arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
