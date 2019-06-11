import 'package:flutter/material.dart';
import 'splashscreen_page.dart';
import 'onboarding_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isChecked = false;
  String _currentYearSelected;
  String _email;
  int _studentid;
  String _password; 

  List<String> _gradYear = ['2019', '2020', '2021', '2022', '2023'];
  final _formKey = GlobalKey<FormState>();
  BuildContext scaffoldContext;

  final _studentidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Registration',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          backgroundColor: Colors.teal,
        ),
        body: Builder(
          builder: (BuildContext context){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child:Column(
                children: <Widget>[
                  TextFormField(   
                    controller:  _emailController,              
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value){
                      Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                    
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }else if(!regex.hasMatch(value)){
                        return 'Enter valid email';
                      }
                    },
                    onSaved: (String value){
                      _email = value;
                      print(_email);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    controller: _studentidController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Student ID',
                        labelText: 'Student ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (String value){
                      Pattern pattern = r'^[0-9]{7}$';
                      RegExp regex = new RegExp(pattern);
                      if (value.isEmpty) {
                        return 'Please enter your student ID';
                      }else if (!regex.hasMatch(value)){
                        return 'Enter valid student ID';
                      }
                    },
                    onSaved: (String value) {
                      _studentid = int.parse(value); 
                      print(_studentid);
                      }
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))
                    ),
                    validator: (String value){
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (String value){
                      if (value.isEmpty) {
                        return 'Please enter an email';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text('     Batch:     ',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        DropdownButton<String>(
                          hint: Text('Please choose graduation year'),
                          value: _currentYearSelected,
                          items: _gradYear.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this._currentYearSelected = newValueSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  CheckboxListTile(
                    value: _isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        _isChecked = newValue;
                      });
                    },
                    title: Text('I agree to the terms and condition',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () {
                            
                          Route route = MaterialPageRoute(
                              builder: (context) => SplashScreenPage());
                          Navigator.push(context, route);
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.redAccent,
                        child: Text('Cancel',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () {
                          print(_currentYearSelected);
                          if (_formKey.currentState.validate() && _isChecked){
                            _formKey.currentState.save();
                            Route route = MaterialPageRoute(
                              builder: (context) => OnBoardingPage());
                            Navigator.push(context, route);
                          }else if (!_isChecked){
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Have you agreed to the terms and conditions?')));
                          }                          
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.lightBlueAccent,
                        child: Text('Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ],
                  )
                ],
              ),
              )
          );
          } ,
        )
      );
  }
}


class User {
  final String email;
  final int studentid;
  final String password;

  User({this.email, this.studentid, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      studentid: json['studentid'],
      password: json['password']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['studentid'] = studentid;
    map['password'] = password;
  }
}

Future<User> createUser (String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode< 200 || statusCode > 400 ||json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));
  });
}