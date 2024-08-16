import 'package:finance_management_app/common_widget/primary_button.dart';
import 'package:finance_management_app/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import '../../common/colour_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;


  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money, color: Colors.white, size: 40),
                  Center(
                    child: Text(
                      "TRACKIZER",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150), // Replacing Spacer with SizedBox
              RoundTextField(
                title: 'Log in',
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              RoundTextField(
                title: 'Password',
                controller: txtPassword,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Icon(isRemember?  Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,size: 15,color: TColor.gray50, )
                      ],
                    )
                  ),


                  TextButton(
                    onPressed: () {  },
                    child: Text(
                      "Remember me",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                title: "Sign In",
                onPressed: () {},
                FontSize: 24,
              ),
              const SizedBox(height: 140 ), // Replacing Spacer with SizedBox
              const Text(
                "If you don't have an account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                title: "Sign Up",
                onPressed2: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpView()));


                },
                FontSize: 14,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



