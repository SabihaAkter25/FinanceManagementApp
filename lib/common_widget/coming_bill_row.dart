import 'package:flutter/material.dart';

class UpcomingBillRow extends StatelessWidget {
  final Map<String, dynamic> sObj;
  final VoidCallback onPressed;

  const UpcomingBillRow({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Safely access the values, providing defaults if necessary
    String name = sObj["Name"] ?? "Unknown";
    String icon = sObj["icon"] ?? "assets/images/default_icon.png";
    String price = sObj["Price"] ?? "0.00";

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
            Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
              alignment: Alignment.center,
              child: const Column(
                children: [
                  Text(
                    "Jun",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "25",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "\$$price",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
