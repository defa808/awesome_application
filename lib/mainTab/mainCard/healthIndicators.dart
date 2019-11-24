import 'package:awesome_application/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HealthIndicators extends StatelessWidget {
  const HealthIndicators({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Consumer<Settings>(
        builder: (context, settingsModel, child) => Column(
          children: <Widget>[
            (settingsModel.showHeartRate
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
                            "Heart rate: 86 BPM",
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
