import 'package:flutter/material.dart';
import '../../common/colour_extension.dart';
import '../../common_widget/coming_bill_row.dart';
import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubcription =true;
  List subArr = [
    {"Name":"Spotify","icon":"assets/images/3D-spotify-logo-premium-PNG.png","Price": "5.99"},
    {"Name":"YouTube Premium","icon":"assets/images/yt.jpeg","Price": "19.88"},
    {"Name":"Microsoft OneDrive","icon":"assets/images/png-transparent-logo-onedrive.png","Price": "29.99"},
    {"Name":"NetFlix","icon":"assets/images/Netflix logo.png","Price": "15.00"},
  ];

  List BilArr =[
    {"Name":"Spotify","Date":DateTime(2023,07,25),"Price": "5.99"},
    {"Name":"YouTube Premium","Date":DateTime(2023,07,25),"Price": "19.88"},
    {"Name":"Microsoft OneDrive","Date":DateTime(2023,07,25),"Price": "29.99"},
    {"Name":"NetFlix","Date":DateTime(2023,07,25),"Price": "15.00"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
    backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: media.width*1.2,
                  decoration: BoxDecoration(
                    color: TColor.gray70,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      SizedBox(
                        width: media.width * 1.1, // Example width
                        height: media.width * 1.0, // Example height
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),

                      Column(mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          const SizedBox(height: 10),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.attach_money, color: Colors.white, size: 25),
                              Center(
                                child: Text(
                                  "TRACKIZER",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),

                          const Text("\$1,234",style: TextStyle(
                              color:Colors.white,fontSize: 45,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                          const Text("This month bills",style: TextStyle(
                              color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 18,),

                          InkWell(
                      onTap:(){},
                      child: Container(
                        padding: EdgeInsets.all(4),
                          height: 30,
                        width: 150,
                        decoration:BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(10),
                        ) ,
                        alignment: Alignment.center,
                        child: const Text(
                          "See your budget",
                          style: TextStyle(
                            fontSize:14,
                            color:  Colors.white ,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                          const SizedBox(height: 60,),
                          Row(
                            children: [
                              Expanded(child: StatusButton(title: 'Active subs',
                                  value: '12', color: TColor.secondary,
                          onPressed: () {  }),
                              ),
                              const SizedBox(width: 8,),
                              Expanded(child: StatusButton(title: 'Highest subs',
                                  value: '\$52', color: Colors.blue,
                                  onPressed: () {  }),
                              ),
                              const SizedBox(width: 8,),

                              Expanded(child: StatusButton(title: 'Lowest subs',
                                  value: '\$5.99', color: Colors.red,
                                  onPressed: () {  }),
                              ),


                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,right: 25),
                  child: Row(children: [
                    const Spacer(),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsView()));
                    },
                      icon: const Icon(Icons.settings_suggest_outlined,color: Colors.white,size: 40,),),

                  ],),
                ),

              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentButton(title: 'Your subscription', onPressed: () {
                        setState(() {
                          isSubcription = !isSubcription;
                        });
                      }, isActive:isSubcription ,),
                  ),
                  Expanded(
                    child: SegmentButton(title: 'Upcoming Bills', onPressed: () {
                      setState(() {
                        isSubcription = !isSubcription;
                      });
                    }, isActive: !isSubcription ,),
                  ),
                ],
              ),
            ),
            if(isSubcription)
            ListView.builder(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subArr.length,
              itemBuilder: (context, index) {
                var sObj = subArr[index] as Map<String, dynamic>;
                String name = sObj["Name"] ?? "Name";
                String icon = sObj["icon"] ?? "default_icon.png";
                String price = sObj["Price"] ?? "0.00";

                return SubscriptionHomeRow(
                  sObj: {"Name": name, "icon": icon, "Price": price},
                  onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionInfoView(sObj:sObj)));
                    
                  },
                );
              },
            ),

            if(!isSubcription)
              ListView.builder(
                padding: const EdgeInsets.all(20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {

                  return UpcomingBillRow(sObj: const {}, onPressed: () {  },);
                },
              ),
            const SizedBox(height: 110,),
          ],
        ),
      ),
    );
  }
}
