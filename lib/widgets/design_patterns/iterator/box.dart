import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:game/constants.dart';

class Box1 extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget child;

  const Box1({
    @required this.nodeId,
    @required this.color,
    this.child,
  })  : assert(nodeId != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .05,
      width: MediaQuery.of(context).size.width * .15,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .15,
            color: color,
          ),
          const SizedBox(height: spaceM),
          if (child != null)
            child,
          //  Text(nodeId.toString(),style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget child;

  const Box({
    @required this.nodeId,
    @required this.color,
    this.child,
  })  : assert(nodeId != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .095,
      width: MediaQuery.of(context).size.width * .09,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .09,
            color: color,
          ),
          const SizedBox(height: spaceM),
          if (child != null)
            child,
          // Text(nodeId.toString(),style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
