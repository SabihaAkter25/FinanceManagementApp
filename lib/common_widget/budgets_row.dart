import 'package:flutter/material.dart';

class BudgetsRow extends StatelessWidget {
  final Map<String, dynamic> bObj;
  final VoidCallback onPressed;

  const BudgetsRow({super.key, required this.bObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Safely access the values, providing defaults if necessary
    String name = bObj["Name"] ?? "Unknown";
    String icon = bObj["icon"] ?? "assets/images/default_icon.png";
    String price = bObj["Price"] ?? "0.00";

    var proVal = (double.tryParse(bObj["Spend_amount"])??0 )/ (double.tryParse(bObj["total_budget"])?? 0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            color: Colors.grey.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child:Column(

            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      icon,
                      width: 45,
                      height: 45,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          "\$${bObj["left_amount"]} left to spend",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                  "\$${bObj["Spend_amount"]}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        "\$${bObj["total_budget"]}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
LinearProgressIndicator(
  backgroundColor: Colors.grey.shade800,
  valueColor: AlwaysStoppedAnimation(bObj["color"]),
  minHeight:3,
  value: proVal,
)


            ],
          ),
        ),
      ),
    );
  }
}
