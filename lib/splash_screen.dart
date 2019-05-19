import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          Route route = MaterialPageRoute(builder: (context) => HomePage());
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
                children: <Widget>[getStarted],
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

/**body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container( 
            decoration: BoxDecoration(color: Colors.greenAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex:2,
                child: Container( 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon( 
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top:10.0)),
                        Text("Onboarding", style:TextStyle(color:Colors.white,
                        fontSize: 24.0,
                        fontWeight:FontWeight.bold)
                        ),
                    ],
                  ),
                ),
              ),

              Expanded(flex:1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top:20.0),
                  ),
                  Text('We Scribe, You Learn.', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:18.0, 
                    fontWeight:FontWeight.bold),
                  ),
                ],
                ),
              ),
          ],)
        ],
      ), */
