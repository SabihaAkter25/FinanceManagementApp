import 'package:flutter/material.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  const SegmentButton({super.key, required this.title, required this.onPressed, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onPressed,
      child: Container(
        decoration:isActive? BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ) : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
