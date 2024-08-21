import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/colour_extension.dart';
import '../add_subscriptions/add_subscription_view.dart';
import '../calender/calender_view.dart';
import '../home/home_view.dart';
import '../spending_budget/spending_budget_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = HomeView();


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black54,
       body: Stack(
         children:[
           PageStorage(
               bucket: pageStorageBucket, child: currentTabView),

           SafeArea(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Stack(
                 alignment: Alignment.bottomCenter,
                 children: [
                   Column(
                     children: [
                       Spacer(),
                       Container(
                         height: 65,
                         width: 400,
                         decoration: BoxDecoration(
                           color: Colors.grey.shade800,
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             IconButton(onPressed: (){
                               setState(() {
                                 selectTab =0;
                                 currentTabView = const HomeView();
                               });

                             },
                               icon: Icon(Icons.home_outlined,size: 40,
                                 color: selectTab==0? Colors.white : Colors.white12),),

                             IconButton(onPressed: (){
                               setState(() {
                                 selectTab =1;
                                 currentTabView = const SpendingBudgetView();
                               });

                             },
                                 icon:  Icon(Icons.business_center_outlined,size: 40,
                                     color: selectTab==1? Colors.white : Colors.white12)),
                             IconButton(onPressed: (){
                               setState(() {
                                 selectTab =2;
                                 currentTabView = const CalenderView();
                               });

                             },
                                 icon: Icon(Icons.calendar_month_outlined,size: 40,
                                     color: selectTab==2? Colors.white : Colors.white12)),
                             IconButton(onPressed: (){
                               setState(() {
                                 selectTab =3;
                                 currentTabView = Container();
                               });

                             },
                                 icon:Icon(Icons.credit_card_outlined ,size: 40,
                                     color: selectTab==3? Colors.white : Colors.white12))

                           ],
                         ),
                       )

                     ],

                   ),

                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddSubscriptionView()));

                     },
                     child: Container(
                       margin: const EdgeInsets.symmetric(vertical: 30),
                       decoration: BoxDecoration(
                         boxShadow: [BoxShadow(
                           color: TColor.secondary.withOpacity(0.25),
                           blurRadius: 10,
                           offset: const Offset(0,4)
                         ),],
                         borderRadius: BorderRadius.circular(50),
                       ),
                       child: Icon(Icons.radio_button_checked_outlined,size: 70,
                       color: Colors.blueGrey.shade200,
                       ),
                     ),
                   )

                 ],
               ),
             )
         ),]
       ),

    );
  }
}
