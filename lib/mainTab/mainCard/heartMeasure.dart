import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartMeasure extends StatefulWidget {
  HeartMeasure({Key key}) : super(key: key) {}

  @override
  _HeartMeasureState createState() => _HeartMeasureState();
}

class _HeartMeasureState extends State<HeartMeasure> {
  @override
  Widget build(BuildContext context) {
    final List<int> args = ModalRoute.of(context).settings.arguments;

    List<Widget> historyWidgets = new List<Widget>();
    for (var i = 1; i < args.length + 1; i++) {
      int item = args[args.length - i];
      historyWidgets.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red[400],
              ),
              SizedBox(width: 15),
              Column(
                children: <Widget>[
                  Text(
                    "21:2${args.length - i}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text("$item"),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Hero(
          child: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(child: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () { Navigator.pop(context, args[args.length-1] > 60);},),
          centerTitle: true,
          title: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Heart Measure"),
              )
            ],
          )),
          backgroundColor: Colors.red[800],
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
                  Colors.red[800],
                  Colors.red[700],
                  Colors.red[600],
                  Colors.red[400],
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
                        child: Text("${args.last}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: historyWidgets,
                        //
                      ),
                    ),
                   ],
                ),
              ),
            ),
          ],
        ),
      ), tag: "Heart",
    );
  }
}
