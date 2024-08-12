import 'dart:ui';

import 'package:flutter/material.dart';

import '../common/colour_extension.dart';

class SecondaryButton extends StatelessWidget {
   final String title;
   final VoidCallback onPressed2;
   final double FontSize;
   final FontWeight fontWeight;


   const SecondaryButton({super.key, required this.title, required this.onPressed2, required this.FontSize, this.fontWeight=FontWeight.w600});



  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: onPressed2,
        child: Container(
          width: 370,
          height:55,
          decoration:  BoxDecoration(

              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color:Colors.blueGrey,blurRadius:4 ,offset: Offset( 0,3
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
