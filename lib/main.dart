import 'package:finance_management_app/view/login/welcome_view.dart';
import 'package:finance_management_app/view/main_tabview/main_tab_view.dart';
import 'package:flutter/material.dart';

import 'common/colour_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
            seedColor: TColor.primary,
        background: TColor.gray80,
            primary: TColor.primary,
          primaryContainer: TColor.secondary,

        ),
        useMaterial3: true,


      ),
      home:const MainTabView(),
    );
  }
}

