import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'registration_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
//  This should be the only page that you will be interested in, adjust your page routing at line 94/95
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 200,
        child: Image.asset('assets/BoardifyLogo.png'),
      ),
    );

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (value.isEmpty) {
          return 'Please enter your email';
        } else if (!regex.hasMatch(value)) {
          return 'Enter valid email';
        }
      },
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            Login newLogin = Login(
                email: _emailController.text,
                password: _passwordController.text);
            print(_isChecked);
            if (_isChecked) {
              saveLoginPreference(
                      _emailController.text, _passwordController.text)
                  .then((bool committed) {
                print("save is successful");
              });
            };
            print(newLogin.toMap());
            final response = await http.post(
                "http://165.22.107.54/api/user/login/",
                body: newLogin.toMap());
            print(response.statusCode);
            if(response.statusCode==200){
              saveUserToken(json.decode(response.body)['token']).then((bool committed) {
                print("User token"+ json.decode(response.body)['token']+ "saved");
                Route route = MaterialPageRoute(builder: (context) => HomePage());
                Navigator.push(context, route);
              });
            }else if(response.statusCode==400 && json.decode(response.body)['non_field_errors'][0]=="Unable to authenticate with provided credentials"){
              _scaffoldstate.currentState.showSnackBar(SnackBar(content: Text('Invalid username or password. Please try again.')));
            }else{
              _scaffoldstate.currentState.showSnackBar(SnackBar(content: Text('Backend error, contact Admin.')));
            };
          };
        },
        padding: EdgeInsets.all(12),
        color: Theme.of(context).primaryColor,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final signupLabel = FlatButton(
      child: Text(
        'New user? Sign up here.',
        style: TextStyle(color: Colors.blue[300]),
      ),
      onPressed: () {
        Route route =
            MaterialPageRoute(builder: (context) => RegistrationPage());
        Navigator.push(context, route);
      },
    );

    final checkBox = new CheckboxListTile(
        title: new Text('Stay logged in.'),
        value: _isChecked,
        onChanged: (bool value) {
          setState(() {
            _isChecked = value;
          });
        });

    return Scaffold(
        key: _scaffoldstate,
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Image.asset('assets/BoardifyLogo.png', scale: 0.8),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 48.0),
                    email,
                    SizedBox(height: 8.0),
                    password,
                  ],
                ),
              ),
              checkBox,
              loginButton,
              forgotLabel,
              signupLabel,
            ],
          ),
        ));
  }
}

class Login {
  final String email;
  final String password;

  Login({this.email, this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
        email: json['email'],
        password: json['password']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}

Future<bool> saveLoginPreference(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("password", password);
  prefs.setString("email", email);
  prefs.setBool('stayLogin', true);
  return prefs.commit();
}

Future<bool> saveUserToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
  return prefs.commit();
}


