import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../common/colour_extension.dart';

class ArcValueModel{
  final Color color;
  final double value;

  ArcValueModel({
    required this.color,
    required this.value,
  });
}


class CustomArc180Painter extends CustomPainter{

  late final double start;
  late final double end;
  late final double width;
  final double blurWidth;
  final double bgwidth;
  final List<ArcValueModel> drwArcs;
  final double space;

  CustomArc180Painter(   {this.space=0.7,required this.drwArcs,required this.bgwidth,this.blurWidth=14,this.start=0, this.end=270,this.width=18, });


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2), radius: size.width/2.5);




    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray70.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180.0 + start;
    var drwStart = startVal;
    canvas.drawArc(rect, radians(startVal), radians(180), false, backgroundPaint); // Background Arc from top-right to bottom-right

    for(var arcObj in drwArcs){
      var endVal = drwStart + arcObj.value;

      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;



      Paint shadowPaint = Paint()
        ..color =  arcObj.color.withOpacity(0.3)
    ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);


      //


      canvas.drawArc(rect, radians(startVal), radians(arcObj.value-4), false, activePaint);     // Active Arc (example adjustment)

      Path path = Path();
      path.addArc(rect,radians(drwStart), radians(arcObj.value-4));

      canvas.drawPath(path,shadowPaint );
      drwStart = drwStart +arcObj.value+ space;

    }


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;


}