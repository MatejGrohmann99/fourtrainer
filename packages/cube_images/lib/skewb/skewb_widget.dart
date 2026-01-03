
import 'package:flutter/material.dart';

class SkewbWidget extends StatelessWidget {
  const SkewbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 170.6,
        height: 152.0,
        child: CustomPaint(
          painter: PuzzlePainter(),
        ),
      ),
    );
  }
}

class PuzzlePainter extends CustomPainter {
  final paintFill = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.fill;

  final paintStroke = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;


  @override
  void paint(Canvas canvas, Size size) {
    final orangeCenter = Path()
      ..moveTo(40,23)
      ..lineTo(77, 88)
      ..lineTo(40, 111)
      ..lineTo(0, 45)
      ..close();

    canvas.drawPath(orangeCenter, paintFill);
    canvas.drawPath(orangeCenter, paintStroke);

    final orangeTopLeftCorner = Path()
      ..moveTo(0,0)
      ..lineTo(38, 20)
      ..lineTo(0, 42)
      ..close();

    canvas.drawPath(orangeTopLeftCorner, paintFill);
    canvas.drawPath(orangeTopLeftCorner, paintStroke);

    final orangeTopRightCorner = Path()
      ..moveTo(41,24)
      ..lineTo(77, 45)
      ..lineTo(77, 87)
      ..close();

    canvas.drawPath(orangeTopRightCorner, paintFill);
    canvas.drawPath(orangeTopRightCorner, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}