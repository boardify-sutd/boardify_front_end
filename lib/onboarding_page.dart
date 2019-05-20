import 'package:flutter/material.dart';
import 'package:frontend/login_page.dart';
import 'home_page.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => new _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndexPage;
  int pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getStarted = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //should be routed to registration page
          Route route = MaterialPageRoute(builder: (context) => LoginPage());
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text(
          'Get Started',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );

    return Scaffold(
      body: Stack(children: <Widget>[
        PageView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome to Boardify',style:TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
                  getStarted],
              ),
              color: Colors.amber,
            ),
            Container(
              color: Colors.blueAccent,
            ),
            Container(color: Colors.greenAccent),
            Container(color: Colors.purpleAccent),
          ],
          onPageChanged: (value) {
            setState(() => currentIndexPage = value);
          },
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.40),
            child: Align(
              alignment: Alignment.centerRight,
              child: new DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
                decorator: DotsDecorator(
                    activeColor: Colors.red, color: Colors.black87),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

