import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_management_app/common_widget/image_button.dart';
import 'package:finance_management_app/common_widget/primary_button.dart';
import 'package:finance_management_app/common_widget/round_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionView();
}

class _AddSubscriptionView extends State<AddSubscriptionView> {
TextEditingController txtDescription = TextEditingController();
  List subArr = [
    {"Name":"HBO GO","icon":"assets/images/HBO-Go-romania-886x590.jpg",},
    {"Name":"Spotify","icon":"assets/images/3D-spotify-logo-premium-PNG.png",},
    {"Name":"YouTube Premium","icon":"assets/images/yt.jpeg",},
    {"Name":"Microsoft OneDrive","icon":"assets/images/png-transparent-logo-onedrive.png",},
    {"Name":"NetFlix","icon":"assets/images/Netflix logo.png",},
  ];

  double amountVal = 0.09;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        Text("New",style: TextStyle(fontSize: 16,color: Colors.grey.shade400),)
                      ],
                      ),



                     ],
                  ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text("   Add new\n subscription",style:
                      TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(
                      width: media.width,
                      height: media.width*0.6,
                      child:CarouselSlider.builder(
                          options:CarouselOptions(
                            autoPlay: false,
                            aspectRatio: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.65,
                            enlargeFactor: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          ),
                          itemCount:subArr.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            var sObj = subArr[itemIndex] as Map? ?? {};

                            return Container(

                              margin: EdgeInsets.all(1),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    sObj["icon"],
                                    width: media.width*0.4,
                                    height: media.width*0.4,
                                    fit: BoxFit.fitHeight,
                                  ),

                                  const Spacer(),

                                  Text(sObj["Name"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),

                                  ),

                                ],
                              ),

                            );

                          }


                      ),),


const SizedBox(height:30 ,),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RoundTextField(
                    controller: txtDescription,
                    textAlign: TextAlign.center, title: '',
                    // Leave out the title parameter or set it to an empty string
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ImageButton(image: "assets/images/plus.jpeg", onPressed: () {
                  amountVal += 0.1;

                  setState(() {

                  });
                },),

                   Column(
                    children: [
                      const Text("Monthly Price",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                      SizedBox(height: 4,),
                      Text("\$${amountVal.toStringAsFixed(2)}"
                          ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      SizedBox(height: 8,),
                      Container(
                        width: 150,
                        height: 1,
                        color: Colors.grey.shade800,
                      )

                    ],
                  ),

                ImageButton(image: "assets/images/minus.png", onPressed: () {
                  amountVal -= 0.1;
                  if(amountVal < 0){
                    amountVal=0;
                  }
                  setState(() {

                  });
                },),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PrimaryButton(title: "Add this platform", onPressed:(){

              }, FontSize: 20),
            ),

            const SizedBox(height:20 ,),

          ],
        ),
      ),
    );
  }
}
