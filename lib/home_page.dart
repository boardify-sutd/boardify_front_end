import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => new _HomePage();

}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center (
        child: RaisedButton(
          onPressed: (){
            removeLoginPreference().then((bool commited){
              print('removed login saved preferences');
              Navigator.pop(context);
            });
          },
          child: Text('Log out'),
        ),
      ),
    );
  }
}

Future<bool> removeLoginPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("password");
  prefs.remove("email");
  prefs.setBool('stayLogin', false);
  return prefs.commit();
}