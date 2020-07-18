import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return AspectRatio(
      aspectRatio: 16 / 11,
      child: LayoutBuilder(
        builder: (_, contraints) {
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/pages/login/clouds.svg',
                      height: contraints.maxHeight * .7,
                      width: contraints.maxWidth,
                    )),
                Positioned(
                    top: contraints.maxHeight * 0.7,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 3,
                          width: contraints.maxWidth,
                          color: Color(0xffeeeeee),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Bienvenido",
                          style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: responsive.ip(3),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Positioned(
                    top: contraints.maxHeight * .28,
                    child: SvgPicture.asset(
                      'assets/pages/login/woman.svg',
                      width: contraints.maxWidth * 0.35,
                    )),
                Positioned(
                    top: contraints.maxHeight * .31,
                    right: 5,
                    child: SvgPicture.asset(
                      'assets/pages/login/men2.svg',
                      width: contraints.maxWidth * 0.26,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
