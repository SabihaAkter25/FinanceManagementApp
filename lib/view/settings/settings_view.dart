import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common_widget/icon_item_row.dart';
import '../../common_widget/item_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
            child: Column(

            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 30,),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                        Text("Settings",style:
                      TextStyle(fontSize: 26,color: Colors.grey.shade400),)
                    ],
                  ),
                ],
              ),
              const SizedBox(height:20 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/71-716892_woman-avatar-icon-png-transparent-png-removebg-preview.jpg",
                  width: 100,
                  height: 100,)
                ],
              ),
              const SizedBox(height:8 ,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sabiha Akter",style:
                  TextStyle(fontSize: 36,color: Colors.grey.shade400,fontWeight: FontWeight.bold),)

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ssabiha104@gmail.com",style:
                  TextStyle(fontSize: 16,color: Colors.grey.shade600,fontWeight: FontWeight.bold),)
                ],
              ),
                 const SizedBox(height: 20,),
              InkWell(
                onTap:(){
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height:20 ,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top:15.0,bottom: 8),
                      child: Text(
                        "General",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      width: 900,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      margin: const EdgeInsets.symmetric(vertical: 28,horizontal: 15),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey.shade800.withOpacity(0.58),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const IconItemRow(title: 'Security', value:'Face ID', icon:"assets/images/security.png"),
                          IconItemSwitchRow(title: 'iCloud Sync',
                            value:true,
                            icon:"assets/images/Cloud Sync.png",
                            didChange: (newVal ) {
                            setState(() {
                              isActive = newVal;
                            });},
                          ),

                        ],
                      ),
                    ),


                    const Padding(
                      padding: EdgeInsets.only(top:15.0,bottom: 8),
                      child: Text(
                        "My Subscription",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      width: 900,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      margin: const EdgeInsets.symmetric(vertical: 28,horizontal: 15),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey.shade800.withOpacity(0.58),

                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          IconItemRow(
                              title: 'Sorting',
                              value:'Date',
                              icon:"assets/images/png-transparent-apps-files-and-folders-folder-storage-sort-sorting-file-3d-icon-thumbnail.png"),
                          IconItemRow(
                            title: 'Summary',
                            value:"Average",
                            icon:"assets/images/png-clipart-computer-icons-business-bar-chart-icon-design-business-blue-angle.png",

                          ),
                          IconItemRow(
                            title: 'Default Currency',
                            value:"USD (\$)",
                            icon:"assets/images/plus.jpeg",
                          ),

                        ],
                      ),
                    ),



                  ],
                ),
              )

            ]
            ),
          ),
        ),
        ),
    );
  }
}
