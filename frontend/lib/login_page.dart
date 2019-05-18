import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void _showSnackBar(){
    //if password is wrong
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text('Wrong password. Please try again!'),
    ));
  }

  bool _verify(){
    //should be a call to lionell's API to verify user
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100,
        child: Image.asset('assets/boardify_logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'sean_lew@mymail.sutd.edu.sg',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

     final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //routing here should depend on whether it is a new user
          //new user => Registration page
          //old user => Home Page
          if(!_verify()){
            _showSnackBar();
          }else{
            Route route = MaterialPageRoute(builder: (context) => HomePage());
            Navigator.push(context, route);
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      );
    
    final forgotLabel = FlatButton(
      child: Text('Forgot password?', 
      style: TextStyle(color: Colors.black54),
      ),
      onPressed:() {},
    );
    
    final checkBox = new CheckboxListTile(
      title: new Text('Remember me'),
      value: _isChecked, 
      onChanged: (bool value){
        setState(() {
          _isChecked=value;}
          );
      }
    );

    return Scaffold(
      key: _scaffoldstate,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right:24.0),
          children: <Widget> [
            logo,
            SizedBox(height:48.0),
            email,
            SizedBox(height: 8.0),
            password,
            checkBox,
            loginButton,
            forgotLabel,
          ],
        )
      ,)
    );
        
  }
}