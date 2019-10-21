import 'package:awesome_application/header.dart';
import 'package:flutter/material.dart';

import 'goalCard.dart';
import 'mainCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController;
  int _cIndex = 0;

  static const double kEffectHeight = 9.0;
  static List<Widget> _widgetOptions = null;
  double offset = 0.0;
  Widget textHide;
  static Widget mainTab = null;

  @override
  Widget build(BuildContext context) {
    double height = (kEffectHeight - offset / 9).clamp(0.0, kEffectHeight);
    double widthScreen = MediaQuery.of(context).size.width;
    if (height > 0)
      textHide = Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: new Text("MI",
              style: TextStyle(
                color: Colors.white,
                height: height,
                fontSize: 16.0,
              )),
        ),
      );
    else
      textHide = Text("");

    mainTab = NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            flexibleSpace: Container(
              padding: EdgeInsets.all(0.0),
              width: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                  centerTitle: true,
                  title: Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        textHide,
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minWidth: 200.0),
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: new TabBar(
                            labelColor: Colors.orange,
                            indicatorColor: Colors.orange,
                            labelPadding: EdgeInsets.all(0.0),
                            labelStyle: TextStyle(fontSize: 10.0),
                            isScrollable: false,
                            tabs: choices.map((Choice choice) {
                              return Container(
                                width: 50.0,
                                height: 20.0,
                                child: Tab(
                                  text: choice.title,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/header2.png",
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ];
      },
      body: Center(
          child: TabBarView(
        children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: MainCard()),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: GoalCard()),
          ])),
          new Icon(Icons.directions_walk),
          new Icon(Icons.directions_run),
          new Icon(Icons.directions_bike),
        ],
      )),
    );

    _widgetOptions = <Widget>[
      mainTab,
      Center(
        child: Text(
          'Friends',
        ),
      ),
      Center(
        child: Text(
          'Profile',
        ),
      ),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: _widgetOptions.elementAt(_cIndex),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _cIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.orange,
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedIconTheme: IconThemeData(color: Colors.orange),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.work), title: new Text('Workout')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), title: new Text('Friends')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: new Text('Profile'))
              ],
              onTap: (index) {
                _incrementTab(index);
              },
            ),
          ),
        ));
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(updateOffset);
  }

  void updateOffset() {
    setState(() {
      offset = scrollController.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(updateOffset);
  }
}

class Choice {
  const Choice({this.title});
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Status'),
  const Choice(title: 'Walking'),
  const Choice(title: 'Running'),
  const Choice(title: 'Cycling')
];
