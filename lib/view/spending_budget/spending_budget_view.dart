import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/colour_extension.dart';
import '../../common_widget/budgets_row.dart';
import '../../common_widget/coming_bill_row.dart';
import '../../common_widget/custom_arc_180_painter.dart';
import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';

class SpendingBudgetView extends StatefulWidget {


  const SpendingBudgetView({super.key, });
  @override
  State<SpendingBudgetView> createState() => _HomeViewState();
}

class _HomeViewState extends State<SpendingBudgetView> {

  List budgetArr = [
    {"Name":"Auto & Transport","icon":"assets/images/transport logo.jpeg","Spend_amount": "25.99","total_budget":"400","left_amount":"374.01","color":Colors.greenAccent},
    {"Name":"EnterTainment","icon":"assets/images/entertainment.jpeg","Spend_amount": "500.99","total_budget":"600","left_amount":"540.01","color":Colors.redAccent},
    {"Name":"Security","icon":"assets/images/security_logo.jpeg","Spend_amount": "5.99","total_budget":"600","left_amount":"504.01","color":Colors.blueAccent},

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 140),

             Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: media.width*0.7,
                  height: media.height*0.01,
                  child: CustomPaint(
                    painter: CustomArc180Painter(
                      end: 40,
                      width: 18,
                      bgwidth:3,
                      drwArcs: [ArcValueModel(color: Colors.green, value: 50),
                      ArcValueModel(color: Colors.red, value: 50),
                      ArcValueModel(color: Colors.deepPurpleAccent, value: 50)],
                    ),
                  ),

                ),

              const Column(
                children: [
                  Text(
                    "\$52.90",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "of \$2.0000 budget",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              )
            ],),

            const SizedBox(height: 40),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: (){},
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    color: Colors.grey.shade800.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child:  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Expanded(
                          child: Text(
                            "Your budget are on tack 👍",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),



            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:60 ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetArr.length,
              itemBuilder: (context, index) {
                var bObj = budgetArr[index] as Map<String, dynamic>;

                return BudgetsRow(bObj: bObj, onPressed: () {  },);
              },
            ),
            SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: (){},
                child: DottedBorder(
                  dashPattern: const [5,4],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  color: Colors.white,
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      
                      color: Colors.grey.shade800.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new Category",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 9,),
                        Icon(Icons.add_to_drive_outlined,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ),
            ),



          ]
        )
    )
    );
  }
}
