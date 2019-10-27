import 'package:flutter/material.dart';

class Acitivity extends StatefulWidget {
  const Acitivity({
    Key key,
  }) : super(key: key);

  @override
  _AcitivityState createState() => _AcitivityState();
}



class _AcitivityState extends State<Acitivity> {
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
                child: Text(
                  "18712",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text("Workout: 35m Burned: 773 kcal",
                    style: TextStyle(color: Colors.grey)),
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
