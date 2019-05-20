import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';

class SplashScreenPage extends StatelessWidget {
  static String tag = 'splashscreen-page';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome back Sean',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Text("Login as existing user"),
                onPressed: () {
                  //route to the login page
                  Route route = MaterialPageRoute(builder: (context) => LoginPage());
                  Navigator.push(context, route);
                },
                color: Colors.redAccent,
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                splashColor: Colors.grey,
              ),
              Divider(color: Colors.grey, height: 20),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Text("Sign up as new user"),
                onPressed: () {
                  //route to the registration page
                  Route route = MaterialPageRoute(builder: (context) => RegistrationPage());
                  Navigator.push(context, route);
                },
                color: Colors.redAccent,
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                splashColor: Colors.grey,
              )
            ],
          ),
        ));
  }
}
