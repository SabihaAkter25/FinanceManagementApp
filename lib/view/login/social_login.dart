import 'package:finance_management_app/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common/colour_extension.dart';
import '../../common_widget/secondary_button.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            children: [
              const SizedBox(height: 80,),
              const Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [

                  Icon(Icons.attach_money,color: Colors.white,size: 40,),
                  Center(child: Text("TRACKIZER",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.white),))
                ],),
              Spacer(),



              InkWell(
                onTap: (){

                },
                child: Container(
                  width: 370,
                  height:55,
                  decoration:  BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(color:Colors.red,blurRadius:4 ,offset: Offset( 0,3
                        ) ),

                      ]
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Icon(Icons.g_mobiledata_outlined,color: Colors.white,size: 39,),
                        const SizedBox(width: 8,),
                        Text("Sgn up with Google",
                          style: TextStyle(color:  TColor.White,fontSize: 20,fontWeight: FontWeight.bold ),),
                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),



        InkWell(
          onTap: (){

          },
          child: Container(
            width: 370,
            height:55,
            decoration:  BoxDecoration(

                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color:Colors.blue,blurRadius:4 ,offset: Offset( 0,3
                  ) ),

                ]
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.facebook_outlined,color: Colors.white,size: 28,),
                  SizedBox(width: 10,),
                  Text("Sgn up with Facebook",
                    style: TextStyle(color:  TColor.White,fontSize: 20,fontWeight: FontWeight.bold ),),
                ],
              ),
            ),

          ),
        ),
const SizedBox(height: 20,),
              const Text("or",style: TextStyle(color: Colors.white,fontSize: 25),),
              const SizedBox(height: 20,),

              SecondaryButton(
                title: "Sign Up with email", onPressed2: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpView()));
              }, FontSize: 14,),
              const SizedBox(height: 20,),

              Text("By registering, you agree to our Terms of Use. Learn how we collect, use and share your data",
                textAlign:TextAlign.center ,
                style: TextStyle(color: TColor.White,
                    fontSize: 20),),
              const SizedBox(height: 40,),
            ]

        ),
      ))
    );
  }
}




