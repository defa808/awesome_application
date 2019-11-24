import 'package:flutter/material.dart';
import 'activity.dart';
import 'healthIndicators.dart';
import 'moreIndicators.dart';

class MainCard extends StatefulWidget {
  final bool expand;
  const MainCard({Key key, this.expand = false}) : super(key: key);
  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard>
    with SingleTickerProviderStateMixin {
  _MainCardState();
  bool expand = false;
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    expandController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)..addListener(() {});
  }

  changeExpandState() {
    setState(() {
      expand = !expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.expand)
      expandController.forward();
    else
      expandController.reverse();

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Activity(),
          Divider(),
          HealthIndicators(),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: MoreIndicators()),
          Divider(),
          ViewMore(openCloseMore: changeExpandState, expand:this.expand),
        ],
      ),
    );
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }
}

class ViewMore extends StatelessWidget {
  final Function openCloseMore;
  final bool expand;

  const ViewMore({Key key, @required this.openCloseMore, @required this.expand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textBtn = expand ? "View less": "View more";
    return SizedBox(
        width: double.infinity,
        child: MaterialButton(
          clipBehavior: Clip.none,
          child: Text(
            textBtn,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          onPressed: openCloseMore,
        ));
  }
}
