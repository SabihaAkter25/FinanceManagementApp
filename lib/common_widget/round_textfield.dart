import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({super.key, required this.title,  this.controller,  this.keyboardType,  this.obscureText=false, required this.textAlign });
final String title;
final TextEditingController? controller;
final TextInputType? keyboardType;
final TextAlign textAlign;
final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(child:Text(
              title,
              textAlign:textAlign ,
              style: TextStyle( color:Colors.grey.shade700 , fontSize: 16)),
          )
        ],),

        Text(title,style: TextStyle( color:Colors.grey.shade700 , fontSize: 16)),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: double.maxFinite,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white12,
          ),
          child:  TextField(
            controller: controller,
            decoration: const InputDecoration(
              focusedBorder:InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,

            ),
keyboardType: keyboardType,
            obscureText: obscureText,

          ),
        )


      ],);
  }
}
