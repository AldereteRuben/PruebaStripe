import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebastripe/libs/auth.dart';
import 'package:pruebastripe/pages/login/widgets/input_text_login.dart';
import 'package:pruebastripe/pages/login/widgets/rounded_button.dart';
import 'package:pruebastripe/utils/responsive.dart';
import 'package:pruebastripe/widgets/circle_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      top: false,
      child: Container(
        width: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InputTextLogin(
                iconPath: "assets/pages/login/icons/correo-electronico.svg",
                placeholder: "Correo Electronico"),
            SizedBox(
              height: responsive.ip(2),
            ),
            InputTextLogin(
                iconPath: "assets/pages/login/icons/llave.svg",
                placeholder: "Contraseña"),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    '¿Recuperar contraseña?',
                    style: TextStyle(fontFamily: 'sans'),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: responsive.ip(2),
            ),
            RoudedButton(onPressed: () {}, label: "Entrar"),
            SizedBox(
              height: responsive.ip(3.3),
            ),
            Text("O continuar con"),
            SizedBox(
              height: responsive.ip(1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                  size: 55,
                  iconPath: 'assets/pages/login/icons/facebook.svg',
                  backgroundColor: Color(0xff1448AFF),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                CircleButton(
                  backgroundColor: Color(0xffFF1744),
                  iconPath: 'assets/pages/login/icons/google.svg',
                  onPressed: () async {
                    await Auth.instance.google();
                    print('listo');
                  },
                  size: 55,
                ),
              ],
            ),
            SizedBox(
              height: responsive.ip(2.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("¿No tienes una cuenta?"),
                CupertinoButton(
                    child: Text(
                      'Registrate',
                      style: TextStyle(
                          fontFamily: 'sans', fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
