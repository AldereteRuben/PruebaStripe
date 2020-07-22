import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebastripe/libs/auth.dart';
import 'package:pruebastripe/pages/home/home_page.dart';
import 'package:pruebastripe/pages/login/widgets/input_text_login.dart';
import 'package:pruebastripe/pages/login/widgets/rounded_button.dart';
import 'package:pruebastripe/utils/extras.dart';
import 'package:pruebastripe/utils/responsive.dart';
import 'package:pruebastripe/widgets/circle_button.dart';

class LoginForm extends StatefulWidget {
  final Alignment alignment;
  final VoidCallback onGoToResgister, onGoToForgetPassword;

  const LoginForm(
      {Key key,
      @required this.onGoToResgister,
      @required this.onGoToForgetPassword,
      this.alignment = Alignment.bottomCenter})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<InputTextLoginState> _emailKey = GlobalKey();
  final GlobalKey<InputTextLoginState> _passwordKey = GlobalKey();

  void _goTo(FirebaseUser user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("error al iniciar sesión");
    }
  }

  Future<void> _submit() async {
    final String email = _emailKey.currentState.value;
    final String password = _passwordKey.currentState.value;

    final bool emailOk = _emailKey.currentState.isOk;
    final bool passwordOk = _passwordKey.currentState.isOk;

    if (emailOk && passwordOk) {
      final FirebaseUser user = await Auth.instance
          .loginByPassword(context, email: email, password: password);

      _goTo(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: widget.alignment,
      child: SafeArea(
        top: false,
        child: Container(
          width: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InputTextLogin(
                key: _emailKey,
                iconPath: "assets/pages/login/icons/correo-electronico.svg",
                placeholder: "Correo Electronico",
                keyboardType: TextInputType.emailAddress,
                validator: (text) => Extras.isValidEmail(text),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                key: _passwordKey,
                iconPath: "assets/pages/login/icons/llave.svg",
                placeholder: "Contraseña",
                obscureText: true,
                validator: (text) {
                  return text.trim().length >= 6;
                },
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    '¿Recuperar contraseña?',
                    style: TextStyle(fontFamily: 'sans'),
                  ),
                  onPressed: widget.onGoToForgetPassword,
                ),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              RoudedButton(
                label: "Entrar",
                onPressed: this._submit,
              ),
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
                    onPressed: () async {
                      final user = await Auth.instance.facebook(context);
                      _goTo(user);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleButton(
                    backgroundColor: Color(0xffFF1744),
                    iconPath: 'assets/pages/login/icons/google.svg',
                    onPressed: () async {
                      final user = await Auth.instance.google(context);
                      _goTo(user);
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
                    onPressed: widget.onGoToResgister,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
