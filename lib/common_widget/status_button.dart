import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final VoidCallback onPressed;

  const StatusButton({super.key, required this.title, required this.onPressed, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children:[
          Container(
            height: 64,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ) ,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

            Container(
              height: 2,
            width: 60 ,
            color: color,),
        ],
      ),
    );
  }
}
