import 'package:awesome_application/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreIndicators extends StatelessWidget {
  const MoreIndicators({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, settingsModel, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: <Widget>[
            (settingsModel.showSlept ?
            Row(
              children: <Widget>[
                Icon(Icons.snooze, color: Colors.red, size: 30),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Slept 5h 27m last night",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Deep sleep 1h 59m",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ) : null),
            SizedBox(
              height: 15,
            ),
          ].where((Object o) => o != null).toList(),
        ),
      ),
    );
  }
}
