import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pruebastripe/utils/app_colors.dart';

class CircleButton extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color backgroundColor;
  final VoidCallback onPressed;
  const CircleButton({
    Key key,
    this.size = 50,
    this.backgroundColor,
    @required this.iconPath,
    @required this.onPressed,
  })  : assert(iconPath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: this.size,
          height: this.size,
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(
            iconPath,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: this.backgroundColor ?? AppColors.primary,
              shape: BoxShape.circle),
        ),
        onPressed: this.onPressed);
  }
}
