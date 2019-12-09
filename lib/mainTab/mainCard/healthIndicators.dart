import 'package:awesome_application/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HealthIndicators extends StatelessWidget {
  const HealthIndicators({
    Key key,
  }) : super(key: key);

  static const List<int> hearRate = [86, 54, 64, 76, 91];

  @override
  Widget build(BuildContext context) {
    int lastHeartRate = hearRate.last;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Consumer<Settings>(
        builder: (context, settingsModel, child) => Column(
          children: <Widget>[
            Hero(
                          child: RawMaterialButton(
                child: (settingsModel.showHeartRate
                    ? Row(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 30),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Heart rate: $lastHeartRate BPM",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "09/30 09:52",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )
                    : null),
                splashColor: Colors.red,
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                      context, '/heartMeasure',
                      arguments: hearRate);
                  String resultMsg = "";
                  if (result) {
                    resultMsg = "Great hear rase.";
                  } else
                    resultMsg = "Wake it up!";

                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$resultMsg"),
                        backgroundColor: Colors.red));
                },
              ), tag: "Heart",
            ),
            SizedBox(
              height: 15,
            ),
            (settingsModel.showWeight
                ? Row(
                    children: <Widget>[
                      Icon(
                        Icons.games,
                        color: Colors.green,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Weight: 68.00kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "09/30 09:52",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )
                : null),
          ].where((Object o) => o != null).toList(),
        ),
      ),
    );
  }
}
