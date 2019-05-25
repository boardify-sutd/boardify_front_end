import 'package:flutter/material.dart';
import 'splashscreen_page.dart';
import 'onboarding_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isChecked = false;
  String _currentYearSelected;
  String _studentID;
  List<String> _gradYear = ['2019', '2020', '2021', '2022', '2023'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    String _email;
    String _password;
    bool _autoValidate = false;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Registration',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child:Column(
                children: <Widget>[
                  TextFormField(                   
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value){
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Student ID',
                        labelText: 'Student ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (String value){
                      if (value.isEmpty) {
                        return 'Please enter your student ID';
                      }                    
                    },
                    onSaved: (value) => _email = value,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
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
                          if (_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            Route route = MaterialPageRoute(
                              builder: (context) => OnBoardingPage());
                            Navigator.push(context, route);
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
        ));

        String _validateEmail(String value) {
          if(value.isEmpty) {
            return "Enter email address";
          }
          // This is just a regular expression for email addresses
          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
          RegExp regExp = new RegExp(p);
          if (regExp.hasMatch(value)) {
              return null;
          }
          return 'Email is not valid';
        }
  }
}
