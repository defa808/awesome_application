import 'package:awesome_application/walkingTab/walkingTab.dart';
import 'package:flutter/material.dart';
import 'headerIcon.dart';
import 'headerNavigator.dart';
import 'mainTab/goalCard/goalCard.dart';
import 'mainTab/mainCard/mainCard.dart';
import 'models/choice.dart';

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
    double heightScreen = MediaQuery.of(context).size.height + offset;
    if (height > 0)
      textHide = HeaderIcon(height: height);
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
            flexibleSpace:
                HeaderNavigator(textHide: textHide, choices: choices),
          ),
        ];
      },
      body: Center(
          child: TabBarView(
        children: <Widget>[
          SingleChildScrollView(child: MainTab()),
          SingleChildScrollView(
            child: WalkingTab(heightScreen: heightScreen),
          ),
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
              selectedItemColor: Colors.deepOrange,
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedIconTheme: IconThemeData(color: Colors.deepOrange),
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

class MainTab extends StatelessWidget {
  const MainTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: MainCard()),
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GoalCard()),
    ]);
  }
}

//mode it to state
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Status'),
  const Choice(title: 'Walking'),
  const Choice(title: 'Running'),
  const Choice(title: 'Cycling')
];
