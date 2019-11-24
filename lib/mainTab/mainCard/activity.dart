import 'package:awesome_application/models/activityData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Activity extends StatelessWidget {
  const Activity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Consumer<ActivityData>(
                    builder: (context, activityData, child) => Text(
                          '${activityData.stepsCount}',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 40),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Consumer<ActivityData>(
                  builder: (context, activityData, child) =>
                  Text("Workout: ${activityData.metersCount}m Burned: ${activityData.getKCal()} kcal",
                      style: TextStyle(color: Colors.grey)), 
                ),
              ),
              Text("Reached today's goal", style: TextStyle(color: Colors.grey))
            ],
          ),
          Icon(Icons.directions_run, color: Colors.deepOrange, size: 40)
        ],
      ),
    );
  }
}
