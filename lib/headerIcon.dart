import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        child: new Text("MI",
            style: TextStyle(
              color: Colors.white,
              height: height,
              fontSize: 16.0,
            )),
      ),
    );
  }
}