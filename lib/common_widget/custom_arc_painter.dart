import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../common/colour_extension.dart';

class CustomArcPainter extends CustomPainter{


  late final double start;
  late final double end;
  late final double width;
  final double blurWidth;

  CustomArcPainter( {this.blurWidth=14,this.start=0, this.end=270,this.width=18});


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2), radius: size.width/2.5);

    var gradientColor = LinearGradient(
      colors: [TColor.secondary, TColor.secondary50, TColor.gray30],
      begin: Alignment.topRight,  // Start from top-right
      end: Alignment.bottomRight, // End at bottom-right
    );
    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;



    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray70.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;


    Paint shadowPaint = Paint()
    ..color = TColor.secondary.withOpacity(0.3)
    ..style = PaintingStyle.stroke
    ..strokeWidth = width + blurWidth
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

var startVal = 135.0 + start;



    canvas.drawArc(rect, radians(startVal), radians(270), false, backgroundPaint); // Background Arc from top-right to bottom-right
    canvas.drawArc(rect, radians(startVal), radians(end), false, activePaint);     // Active Arc (example adjustment)

    Path path = Path();
    path.addArc(rect,radians(startVal), radians(end));
    
canvas.drawPath(path,shadowPaint );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  
}