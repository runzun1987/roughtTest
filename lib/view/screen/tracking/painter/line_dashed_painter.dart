import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  Color color;

  LineDashedPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..color = color;
    var max = 65;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    final p1 = Offset(0, startY);
    final p2 = Offset(250, 150);

    while (max >= 0) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashWidth, 0), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
