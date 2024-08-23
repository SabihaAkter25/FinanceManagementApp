import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import '../../common_widget/subscription_cell.dart';
import '../settings/settings_view.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
  CalendarAgendaController();

  late DateTime _selectedDateNotAppBBar;
  Random random = new Random();


  List subArr = [
    {"Name": "Spotify", "icon": "assets/images/3D-spotify-logo-premium-PNG.png", "Price": "5.99"},
    {"Name": "YouTube Premium", "icon": "assets/images/imyou tube premimum logo.png", "Price": "19.88"},
    {"Name": "Microsoft OneDrive", "icon": "assets/images/png-transparent-logo-onedrive.png", "Price": "29.99"},
    {"Name": "NetFlix", "icon": "assets/images/Netflix logo.png", "Price": "15.00"},
  ];

  @override
  void initState() {
    super.initState();

    _selectedDateNotAppBBar = DateTime.now();
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                height: media.width * 1.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade800.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Stack(children: [
                       Row(
                         mainAxisAlignment:MainAxisAlignment.center,
                         children: [
                           Text("Calender", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
                         ],
                       ),
                       Row(children: [
                         const Spacer(),
                         IconButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsView()));
                         },
                           icon: const Icon(Icons.settings_suggest_outlined,color: Colors.white,size: 40,),),

                       ],),
                     ],),
                      SizedBox(height: 25,),
                      Text("Subs\nSchedule", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [


                          const Text("3 Subscription for today", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600)),
                  InkWell(

                    onTap:(){
                      calendarAgendaControllerNotAppBar.openCalendar();


                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      decoration:BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(25),
                      ) ,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "January",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.expand_more,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),

                        ],
                      ),


                      CalendarAgenda(
                        fullCalendarBackgroundColor: Colors.grey.shade800,
                        backgroundColor: Colors.transparent,
                        controller: calendarAgendaControllerNotAppBar,

                        // fullCalendar: false,
                        locale: 'en',
                        weekDay: WeekDay.short,
                        fullCalendarDay: WeekDay.short,
                        selectedDateColor: Colors.white,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 140)),
                        lastDate: DateTime.now().add(const Duration(days: 4)),
                        events: List.generate(
                            100,
                                (index) => DateTime.now()
                                .subtract(Duration(days: index * random.nextInt(5)))),
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDateNotAppBBar = date;
                          });
                        },

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade800,
                          ),
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        selectDecoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.grey,

                          borderRadius: BorderRadius.circular(15),
                        ),

                        selectedEventLogo: Container(
                          height: 5,
                          width: 3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),

                        eventLogo: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.cyan,
                            ),
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),

                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("January", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("\$24.98", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("17.08.24", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("In upcoming bills", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  var sObj = subArr[index] as Map? ?? {};
                  return SubscriptionCell(
                    sObj: sObj,
                    onPressed: () {},
                  );
                },
                childCount: subArr.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 130),
          ),
        ],
      ),
    );
  }
}
