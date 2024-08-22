import 'package:dotted_border/dotted_border.dart';
import 'package:finance_management_app/common_widget/secondary_button.dart';
import 'package:flutter/material.dart';

import '../../common_widget/item_row.dart';

class SubscriptionInfoView extends StatefulWidget {
  const SubscriptionInfoView({super.key, required this.sObj});
final Map sObj;
  @override
  State<SubscriptionInfoView> createState() => _SubscriptionInfoViewState();
}

class _SubscriptionInfoViewState extends State<SubscriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(

                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade800.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child:
                    Column(
                      children: [
                        Container(
                          height: media.height * 0.39,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),

                          ),

                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 50,),),
                                  Text("Subscription info",style: TextStyle(fontSize: 19,color: Colors.grey.shade400),),

                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    icon: const Icon(Icons.restore_from_trash_outlined,color: Colors.white,size: 40,),),


                                ],
                              ),
                              const Spacer(),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(widget.sObj["icon"],
                                  width: media.width*0.35,
                                  height: media.width*0.35,),
                              ),
                               const SizedBox(height: 10,),
                              Text(
                                widget.sObj["Name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10,),

                               Text(
                                  "\$${widget.sObj["Price"]}",
                                  style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),

                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                          height: media.height * 0.5,
                          child: Column(
                            children: [
                              Container(
                                height: media.width * 0.74,
                                margin: const EdgeInsets.symmetric(vertical: 28,horizontal: 15),
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueGrey.shade800.withOpacity(0.58),

                                ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  ItemRow(title: 'Name', value: widget.sObj['Name'],),
                                  const ItemRow(title: 'Description', value:'Music app',),
                                  const ItemRow(title: 'Category', value:'Entertainment',),
                                  const ItemRow(title: 'First payment', value: '00.07.2023',),
                                  const ItemRow(title: 'Remainder', value: 'Never',),
                                  const ItemRow(title: 'Currency', value: 'USD \$',),

                                ],
                              ),
                              ),
                              SizedBox(height: 20,),

                              SecondaryButton(title: "Save", onPressed2: (){}, FontSize: 12),


                            ],
                          ),
                        ),
                      ],
                    ),



              ),
              Container(
                margin: EdgeInsets.only(top: 20,right: 4,left: 4),
                height: media.width* 0.9 + 15,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    Expanded(
                      child: DottedBorder(
                        dashPattern: const [5,10],
                        padding: EdgeInsets.zero,
                        strokeWidth: 3,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        color: Colors.black,
                        child: SizedBox(
                          height: 0,
                        ),

                      ),),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)
                      ),),

                  ],
                ),),


            ],
          ),
        ),
      ) ,
    );
  }
}
