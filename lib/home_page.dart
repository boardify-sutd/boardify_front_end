import 'package:flutter/material.dart';

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
            Navigator.pop(context);
          },
          child: Text('Log out'),
        ),
      ),
    );
  }
}
