import 'dart:async';

import 'package:awesome_application/models/activityData.dart';
import 'package:awesome_application/models/walkingModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void dispose() {
    super.dispose();
  }

  startTimer() {
    // this.getActivityDataModel().resetSteps();
    this.getWalkingModel().resetTimer();
    this.getWalkingModel().startTimer();
  }

  finishTimer() {
    this.getWalkingModel().finishTimer();
  }

  WalkingModel getWalkingModel() {
    return Provider.of<WalkingModel>(context, listen: false);
  }

  ActivityData getActivityDataModel() {
    return Provider.of<ActivityData>(context, listen: false);
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
                  Consumer<WalkingModel>(
                      builder: (context, walkingModel, child) =>
                          (walkingModel.isTimerAllive
                              ? RaisedButton(
                                  child: Text("Stop"),
                                  onPressed: finishTimer,
                                  color: Colors.deepOrange,
                                  textColor: Colors.white)
                              : RaisedButton(
                                  child: Text("Run"),
                                  onPressed: startTimer,
                                  color: Colors.deepOrange,
                                  textColor: Colors.white)))
                ],
              ),
            ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                          child: Text(
                            "Timer:",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 38),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                          child: Consumer<WalkingModel>(
                            builder: (context, activityData, child) => Text(
                              activityData.duration.toString(),
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                          child: Text(
                            "Sinchronized:",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, right: 15.0, left: 15.0, top: 15),
                          child: Consumer<ActivityData>(
                            builder: (context, activityData, child) => Text(
                              activityData.isSynchronized.toString(),
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
