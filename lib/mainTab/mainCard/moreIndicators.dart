import 'package:flutter/material.dart';

class MoreIndicators extends StatelessWidget {
  const MoreIndicators({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: <Widget>[
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 3),
        Text(
          "Deep sleep 1h 59m",
          style: TextStyle(color: Colors.grey),
        )
      ],
    )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ],
      ),
    );
  }
}