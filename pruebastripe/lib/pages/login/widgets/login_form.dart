import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebastripe/pages/login/widgets/input_text_login.dart';
import 'package:pruebastripe/pages/login/widgets/rounded_button.dart';
import 'package:pruebastripe/utils/responsive.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InputTextLogin(
              iconPath: "assets/pages/login/icons/correo-electronico.svg",
              placeholder: "Correo Electronico"),
          SizedBox(
            height: 10,
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
            height: 10,
          ),
          RoudedButton(onPressed: () {}, label: "Entrar"),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
