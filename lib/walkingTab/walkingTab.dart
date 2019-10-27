import 'dart:async';

import 'package:flutter/material.dart';

class WalkingTab extends StatefulWidget {
  WalkingTab({Key key, @required this.heightScreen}) : super(key: key);

  final double heightScreen;

  @override
  _WalkingTabState createState() => _WalkingTabState();
}

class _WalkingTabState extends State<WalkingTab> {
  double duration = 0;
  bool isTimerAllive = false;

  @override
  void initState() {
    super.initState();
  }

  startTimer() {
    setState(() {
      isTimerAllive = true;
      duration = 0.0;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isTimerAllive)
        setState(() {
          duration = duration + 1;
        });
      else {
        timer.cancel();
      }
    });
  }

  finishTimer() {
    setState(() {
      isTimerAllive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: widget.heightScreen * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  (isTimerAllive
                      ? RaisedButton(
                          child: Text("Stop"),
                          onPressed: finishTimer,
                          color: Colors.deepOrange,
                          textColor: Colors.white)
                      : RaisedButton(
                          child: Text("Run"),
                          onPressed: startTimer,
                          color: Colors.deepOrange,
                          textColor: Colors.white)),
                ],
              ),
            ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Container(
                height: widget.heightScreen * 0.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                      child: Text(
                        "Timer:",
                        style: TextStyle(color: Colors.black26, fontSize: 38),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                      child: Text(
                        this.duration.toString(),
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
