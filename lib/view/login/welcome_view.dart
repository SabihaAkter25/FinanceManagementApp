import 'package:finance_management_app/common/colour_extension.dart';
import 'package:finance_management_app/view/login/sign_in_view.dart';
import 'package:finance_management_app/view/login/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common_widget/primary_button.dart';
import '../../common_widget/secondary_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
void initState(){
  super.initState();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body:Stack(
        children: [
          Image.asset("assets/images/gettyimages-1063758830-640x640.jpg",width: media.width,height: media.height,fit: BoxFit.cover,),
SafeArea(child: Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    children: [
      const SizedBox(height: 50,),
      const Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [

        Icon(Icons.attach_money,color: Colors.white,size: 40,),
        Center(child: Text("TRACKIZER",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.white),))
      ],),
      Spacer(),
      Text("Take control of your financial future simplify, plan, and grow with our finance management app.",
      textAlign:TextAlign.center ,
      style: TextStyle(color: TColor.White,
          fontSize: 20),),
      const SizedBox(height: 30,),
      PrimaryButton(title: 'Get Started', onPressed: () { 
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SocialLogin())
        );
      }, FontSize: 14,),

      const SizedBox(height: 20,),

      SecondaryButton(title: "'I've an account", onPressed2: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInView()));

      }, FontSize: 14,),

      const SizedBox(height: 80,),
    ]

  ),
))
        ],
      ) ,
    );
  }
}
