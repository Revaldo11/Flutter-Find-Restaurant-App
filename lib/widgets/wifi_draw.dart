import 'package:flutter/material.dart';

import '../theme.dart';

class DrawPath extends CustomPainter {
  final double height1;
  final double height2;
  final double height3;
  final double height4;

  DrawPath(
    this.height1,
    this.height2,
    this.height3,
    this.height4,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Color designColor = primaryColor;

    Paint firstPaint = Paint()
      ..color = designColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    Paint secondPaint = Paint()
      ..color = designColor
      ..style = PaintingStyle.fill;

    Path firstPath = Path();
    firstPath.moveTo(0, size.height * height1);
    firstPath.arcToPoint(
      Offset(size.width, size.height * height1),
      radius: const Radius.circular(135),
    );

    canvas.drawPath(firstPath, firstPaint);

    Path secondPath = Path();
    secondPath.moveTo(size.width * .16, size.height * height2);
    secondPath.arcToPoint(
      Offset(size.width * .84, size.height * height2),
      radius: const Radius.circular(90),
    );

    canvas.drawPath(secondPath, firstPaint);

    Path thirdPath = Path();
    thirdPath.moveTo(size.width * .33, size.height * height3);
    thirdPath.arcToPoint(
      Offset(size.width * .67, size.height * height3),
      radius: const Radius.circular(43),
    );

    canvas.drawPath(thirdPath, firstPaint);

    canvas.drawCircle(
        Offset(size.width * .5, size.height * height4), 17, secondPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
