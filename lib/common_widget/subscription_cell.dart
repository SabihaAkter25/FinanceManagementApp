import 'package:flutter/material.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const SubscriptionCell({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Safely access the values, providing defaults if necessary
    String name = sObj["Name"] ?? "Unknown";
    String icon = sObj["icon"] ?? "assets/images/default_icon.png";
    String price = sObj["Price"] ?? "0.00";

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
          color: Colors.blueGrey.shade800.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(icon, width: 45, height: 45,),
            ),
            const Spacer(),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "\$$price",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
