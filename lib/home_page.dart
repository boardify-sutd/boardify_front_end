import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/login_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => new _HomePage();

}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:() {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: Center (
        child: RaisedButton(
          onPressed: (){
            removeLoginPreference().then((bool commited){
              print('removed login saved preferences');
              Route route = MaterialPageRoute(
                  builder: (context) => LoginPage());
              Navigator.push(context, route);
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

class DataSearch extends SearchDelegate<String>{

  final cities=[
    "Singapore",
    "Malaysia",
    "China",
    "America",
    "Taiwan",
    "Sydney",
    "Sushi",
    "SAYONARA"
  ];

  final recent=[
    "America",
    "Taiwan"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Leading icon on the left of the app bar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,),
        onPressed: (){
          close(context,null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //Show some results based on the selection
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          )
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Show when someone searches for anything
    final suggestionList = query.isEmpty?recent:cities.where((p)=>p.startsWith(query)).toList();

    return
      Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5)
      ),
      child: ListView.builder(
          itemBuilder: (context,index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(text:TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [TextSpan(
                text:suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )]
            ),

            ),
          ),
      itemCount: suggestionList.length),
    );
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}