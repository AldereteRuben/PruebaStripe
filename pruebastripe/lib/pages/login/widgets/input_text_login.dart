import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class InputTextLogin extends StatelessWidget {
  final String iconPath, placeholder;
  const InputTextLogin(
      {Key key, @required this.iconPath, @required this.placeholder})
      : assert(iconPath != null && placeholder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      prefix: Container(
        width: 40,
        height: 30,
        padding: EdgeInsets.all(2),
        child: SvgPicture.asset(
          this.iconPath,
          color: Color(0xffcccccc),
        ),
      ),
      style: TextStyle(fontFamily: 'sans'),
      placeholder: this.placeholder,
      placeholderStyle: TextStyle(fontFamily: 'sans', color: Color(0xffcccccc)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffdddddd),
          ),
        ),
      ),
    );
  }
}
