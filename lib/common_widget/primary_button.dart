import 'package:flutter/material.dart';
import '../common/colour_extension.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double FontSize;
  final FontWeight fontWeight;


   const PrimaryButton({super.key, required this.title, required this.onPressed, required this.FontSize, this.fontWeight=FontWeight.w600});



  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: onPressed,
        child: Container(
          width: 370,
          height:55,
          decoration:  BoxDecoration(
               image: const DecorationImage(
                image: AssetImage("assets/images/Untitled_design_6_-removebg-preview.png"),
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color:Colors.blue,blurRadius:4 ,offset: Offset( 0,3
                ) ),

              ]
          ),
          child: Center(
            child: Text(title,
              style: TextStyle(color:  TColor.White,fontSize: 20,fontWeight: FontWeight.bold ),),
          ),

        ),
      );

  }
}
