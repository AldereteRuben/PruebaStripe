import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoudedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoudedButton({Key key, @required this.onPressed, @required this.label})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoButton(
      padding: EdgeInsets.zero,
      child: (Container(
        child: Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'sans',
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
            borderRadius: BorderRadius.circular(30)),
      )),
      onPressed: this.onPressed,
    ));
  }
}
