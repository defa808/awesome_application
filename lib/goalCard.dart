import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.star, size: 30),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Goal Tracker",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 3),
                    Text("Reach goal for 2 days in a row.",
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Text(
              'Kind of chart graphic',
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
