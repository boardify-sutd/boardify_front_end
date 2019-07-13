import 'package:flutter/material.dart';
import 'login_page.dart';
import 'onboarding_page.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding1_page.dart';

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
    home: _stayLogin == true ? HomePage() : LoginPage()
  ));
}



Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
//Difference between stateful(keep track of certain data) and stateless(does not care about any data)

//Future<Null> checkStayLogin() async {
//  bool _stayLogin = false;
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  _stayLogin = prefs.getBool('stayLogin');
//  if (_stayLogin){
//    print('already login');
//  }else{
//    print('Not  logged in');
//  }
//}