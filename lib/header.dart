import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Row(
        children: <Widget>[
          // Image.asset('images/header.png'),
          // IconButton(
          //   iconSize: 50,
          //   icon: const Icon(Icons.add),
          //   tooltip: 'Add',
          //   onPressed: () {},
          // ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
