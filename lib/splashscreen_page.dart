import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';

class SplashScreenPage extends StatelessWidget {
  static String tag = 'splashscreen-page';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Image.asset('assets/BoardifyLogo.png',scale:0.7),
              Image.asset('assets/whiteboardlogo.png'),

              Container(
                child: Column(

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width:300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: Text("Login as existing user", style: TextStyle(fontSize: 24),),
                          onPressed: () {
                            //route to the login page
                            Route route = MaterialPageRoute(builder: (context) => LoginPage());
                            Navigator.push(context, route);
                          },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(12),
                          splashColor: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width:300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: Text("Sign up as new user",style: TextStyle(fontSize: 24),),
                          onPressed: () {
                            //route to the registration page
                            Route route = MaterialPageRoute(builder: (context) => RegistrationPage());
                            Navigator.push(context, route);
                          },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(12),
                          splashColor: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
              ),


            ],
          ),
        ));
  }
}
