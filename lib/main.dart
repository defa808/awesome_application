import 'dart:convert';
import 'package:awesome_application/mainTab/mainCard/heartMeasure.dart';
import 'package:awesome_application/models/settings.dart';
import 'package:awesome_application/walkingTab/walkingTab.dart';
import 'package:flutter/material.dart';
import 'headerIcon.dart';
import 'headerNavigator.dart';
import 'mainTab/goalCard/goalCard.dart';
import 'mainTab/mainCard/mainCard.dart';
import 'models/activityData.dart';
import 'models/choice.dart';
import 'package:provider/provider.dart';
import 'models/walkingModel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ActivityData>.value(notifier: ActivityData()),
      ChangeNotifierProvider<WalkingModel>.value(notifier: WalkingModel()),
      ChangeNotifierProvider<Settings>.value(notifier: Settings())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<WalkingModel>(context, listen: false).addListener(() {
      Provider.of<ActivityData>(context, listen: false).incrementSteps();
    });

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

  Future<void> refreshState() async {
    await Provider.of<ActivityData>(context, listen: false).fetchData();
  }

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
          RefreshIndicator(
            child: SingleChildScrollView(child: MainTab()),
            onRefresh: refreshState,
          ),
          SingleChildScrollView(
            child: WalkingTab(heightScreen: heightScreen),
          ),
          new Icon(Icons.directions_run),
          new Icon(Icons.directions_bike),
        ],
      )),
    );

    Widget profileTab = Consumer<Settings>(
      builder: (context, settingsModel, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Text("Show the main item", style: TextStyle(fontSize: 16.0)),
            CheckboxListTile(
              title: Text("Show Weight"),
              value: settingsModel.showHeartRate,
              onChanged: Provider.of<Settings>(context, listen: false)
                  .changeShowHeartRate,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Show Weight"),
              value: settingsModel.showWeight,
              onChanged: Provider.of<Settings>(context, listen: false)
                  .changeShowWeight,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Show Slept"),
              value: settingsModel.showSlept,
              onChanged:
                  Provider.of<Settings>(context, listen: false).changeShowSlept,
              controlAffinity: ListTileControlAffinity.leading,
            )
          ],
        ),
      ),
    );

    _widgetOptions = <Widget>[
      mainTab,
      Center(
        child: Text(
          'Friends',
        ),
      ),
      profileTab
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => DefaultTabController(
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
                  drawer: Drawer(
                    // Add a ListView to the drawer. This ensures the user can scroll
                    // through the options in the drawer if there isn't enough vertical
                    // space to fit everything.
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          child: Text('Drawer Header'),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                        ListTile(
                          title: Text('Item 1'),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Item 2'),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          "/heartMeasure": (context) => HeartMeasure(),
        });
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

    Provider.of<Settings>(context, listen: false).initSettings();
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
