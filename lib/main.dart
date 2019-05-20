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
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Nunito',
        ),
        home: SplashScreenPage());
  }
}

//Difference between stateful(keep track of certain data) and stateless(does not care about any data)
