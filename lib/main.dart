import 'package:flutter/material.dart';
import 'login_page.dart';
import 'onboarding_page.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _stayLogin = prefs.getBool('stayLogin');


  runApp(MaterialApp(
    title: 'Boardify',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor:  Color(0xFF34495E),
      fontFamily: 'Futura',
    ),
    //  Fetches the _stayLogin variable from sharedPreferences, Not really sure how long does one session last for the token with Lionell's API, if there is a timeout then it is possible that we have to route to LoginPage and do an automatic Login using the email and password stored in SharedPreferences to get a new valid token for the same user.
    home: _stayLogin == true ? HomePage() : LoginPage()
  ));
}



Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
