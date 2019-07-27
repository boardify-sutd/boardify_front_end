import 'package:flutter/material.dart';
import 'splashscreen_page.dart';
import 'onboarding1_page.dart';
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


  List<String> _gradYear = ['2019', '2020', '2021', '2022', '2023'];
  final _formKey = GlobalKey<FormState>();
  BuildContext scaffoldContext;

  final _studentidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Registration',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Builder(
          builder: (BuildContext context){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child:ListView(
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
                      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                    
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }else if(!regex.hasMatch(value)){
                        return 'Enter valid email';
                      }
                    },
                    onSaved: (String value){

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
                      onSaved: (String value) {

                      }
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          labelText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))
                      ),
                      validator: (String value){
                        if (value.isEmpty) {
                          return 'Please enter a username';
                        }
                      },
                      onSaved: (String value) {

                      }
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
                        return 'Please confirm your password';
                      }else if (value != _passwordController.text){
                        return 'Please check to make sure your  passwords match';
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
                        color: Theme.of(context).primaryColor,
                        child: Text('Cancel',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () async{                        
                          if (_formKey.currentState.validate() && _isChecked){
                            _formKey.currentState.save();
                            User newUser = User(email: _emailController.text,student_id: _studentidController.text,password: _passwordController.text, username:_usernameController.text, graduating_year: this._currentYearSelected);
                            print (newUser.toMap());
                            final response = await http.post("http://165.22.107.54/api/user/register/",body:newUser.toMap());
                            print(response.statusCode);

                            if(response.statusCode == 201){
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registration Succesful!')));
                              Route route = MaterialPageRoute(
                              builder: (context) => OnBoardingPage1());
                              Navigator.push(context, route);
                            }else if (response.statusCode==400 && ((json.decode(response.body)['email'][0]) == "user with this email already exists")){
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('This email is already used')));
                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please make sure you have filled up the fields correctly')));
                            }
                          }else if (!_isChecked){
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Have you agreed to the terms and conditions?')));
                          }                          
                        },
                        padding: EdgeInsets.all(12),
                        color: Theme.of(context).primaryColor,
                        child: Text('Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      RaisedButton(
                        child: Text('Bypass'),
                        onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => OnBoardingPage1());
                            Navigator.push(context, route);
                        },
                      )
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
  final String username;
  final String password;
  final String student_id;
  final String graduating_year;

  User({this.email, this.username, this.password, this.student_id, this.graduating_year});

  //Deserialize Json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      username: json['username'],
      password: json['password'],
      student_id: json['student_id'],
      graduating_year: json['graduating_year']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['username'] = username;
    map['password'] = password;
    map['student_id']= student_id;
    map['graduating_year'] = graduating_year;

    return map;
  }
}

