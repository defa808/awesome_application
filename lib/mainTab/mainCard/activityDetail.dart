import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  final int goalSteps = 8000;
  
  ActivityDetail({Key key, int steps, int meters, int kCal}) : super(key: key) {
    this.steps = steps;
    this.meters = meters;
    this.kCal = kCal;
  }
  int steps = 0;
  int meters = 0;
  int kCal = 0;

  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(child: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () { Navigator.pop(context, widget.steps > widget.goalSteps);},),
        centerTitle: true,
        title: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text("Activity Detail"),
            ),
            Text(
              "21:30 syncronized",
              style: TextStyle(fontSize: 8),
            )
          ],
        )),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(widget.steps.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("steps",
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Already of 12% of users",
                        style: TextStyle(fontSize: 10, color: Colors.white54)),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.blue[400],
                      ),
                      SizedBox(width: 15),
                      Text("Distance "+ (widget.meters / 1000).toString()  + " km")
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.fastfood,
                        size: 30,
                        color: Colors.blue[400],
                      ),
                      SizedBox(width: 15),
                      Text("Burned "+ widget.kCal.toString() +" kcal")
                    ],
                  ),
                )
              ],
              //
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, widget.steps > widget.goalSteps);
                },
                color: Colors.blue[300],
                child: Text(
                  'Go back',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
