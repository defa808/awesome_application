import 'package:flutter/material.dart';

import 'models/choice.dart';

class HeaderNavigator extends StatelessWidget {
  const HeaderNavigator({
    Key key,
    @required this.textHide,
    @required this.choices
  }) : super(key: key);

  final Widget textHide;
  final List<Choice> choices;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      width: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(255,130,2,1), Color.fromRGBO(255, 223, 165, 1)],
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
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicator: UnderlineTabIndicator(
                                insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                              ),
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
    );
  }
}

