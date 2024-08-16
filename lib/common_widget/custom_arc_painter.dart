import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../common/colour_extension.dart';

class CustomArcPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2), radius: size.width/2.5);

    var gradientColor = LinearGradient(
        colors:[TColor.secondary,TColor.secondary50,TColor.gray30] ,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = 18;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint()..shader = gradientColor.createShader(rect);
    backgroundPaint.color = TColor.gray30;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = 18;
    backgroundPaint.strokeCap = StrokeCap.round;

    canvas.drawArc(rect,degrees(-89) ,radians(240), false, backgroundPaint);
    canvas.drawArc(rect,degrees(-80) ,radians(210), false, activePaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  
}