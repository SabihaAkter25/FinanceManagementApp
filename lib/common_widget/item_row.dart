import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String title;
  final String value;
  const ItemRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(

        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:14 ),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 40,),
        ],
      ),
    );
  }
}
