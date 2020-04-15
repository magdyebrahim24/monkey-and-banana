import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttons extends StatefulWidget {
  Buttons({text, btnwidth}) {
    this.text = text;
    this.btnwidth = btnwidth;
  }

  double btnwidth = .4;

  String text = '';

  fun() {}

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width * widget.btnwidth,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
//                border: Border.all(
//                  color: Colors.white.withOpacity(0.7),
//                  width: 3.0,
//                ),
            color: Color(0xff0c6d630),
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        // c6d630
      ),
    );
  }

  void fun() {}
}

// ignore: must_be_immutable
class CircleButton extends StatefulWidget {
  CircleButton({icn}) {
    this.icn = icn;
  }

  IconData icn;

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      height: MediaQuery.of(context).size.width * .15,
      child: Icon(widget.icn, color: Color(0xff0c6d630)),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * .15),
        color: Colors.white,
      ),
    );
  }
}
