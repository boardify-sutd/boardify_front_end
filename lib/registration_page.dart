import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isChecked = false;
  String _currentYearSelected = null;
  List<String> _gradYear = ['2019', '2020', '2021', '2022', '2023'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Student ID',
                    labelText: 'Student ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
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
                        borderRadius: BorderRadius.circular(20.0))),
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
                        style: TextStyle(color: Colors.grey)),
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
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    onPressed: () {},
                    padding: EdgeInsets.all(12),
                    color: Colors.redAccent,
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),                  
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child:
                        Text('Register', style: TextStyle(color: Colors.white,fontSize: 18)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
