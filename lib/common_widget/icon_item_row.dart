import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconItemRow extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  const IconItemRow({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(

        children: [
          Image.asset(icon,
          height: 30,
          width: 30,),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5 ),
              child: Text(
                value,
                style: const TextStyle(
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

class IconItemSwitchRow extends StatelessWidget {
  final String title;
  final bool value;
  final String icon;
  final Function(bool)? didChange;
   const IconItemSwitchRow({super.key, required this.title, required this.value, required this.icon,required this.didChange});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(

        children: [
          Image.asset(icon,
            height: 30,
            width: 30,),
          const SizedBox(height: 20,),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
         
CupertinoSwitch(value: value, onChanged: didChange)        ],
      ),
    );
  }
}
