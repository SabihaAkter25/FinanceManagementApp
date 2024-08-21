import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const ImageButton({super.key, required this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap:onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(16),
        )
           ,
        alignment: Alignment.center,
        child: Image.asset(image,width: 50,height: 50,)
      ),
    );
  }
}
