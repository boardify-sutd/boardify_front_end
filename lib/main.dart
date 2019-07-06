import 'package:flutter/material.dart';
import 'login_page.dart';
import 'onboarding_page.dart';
import 'registration_page.dart';
import 'splashscreen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boardify', 
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:  Color(0xFF34495E),
          fontFamily: 'Futura',
        ),
        home: SplashScreenPage());
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
//Difference between stateful(keep track of certain data) and stateless(does not care about any data)
