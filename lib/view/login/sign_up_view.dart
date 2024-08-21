import 'package:finance_management_app/common_widget/primary_button.dart';
import 'package:finance_management_app/view/login/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colour_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

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
                title: 'Email Address',
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress, textAlign: TextAlign.center,
              ),
              RoundTextField(
                title: 'Password',
                controller: txtPassword,
                keyboardType: TextInputType.emailAddress,
                obscureText: true, textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade800,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade800,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade800,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade800,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Use B or more characters with a mix of letters,\nNumbers and symbols",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                title: "Get started, It's Free",
                onPressed: () {},
                FontSize: 24,
              ),
              const SizedBox(height: 100 ), // Replacing Spacer with SizedBox
              const Text(
                "Do you already have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                title: "Sign in",
                onPressed2: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInView()));

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



