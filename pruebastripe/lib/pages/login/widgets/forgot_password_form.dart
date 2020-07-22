import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebastripe/libs/auth.dart';
import 'package:pruebastripe/pages/home/home_page.dart';
import 'package:pruebastripe/pages/login/widgets/input_text_login.dart';
import 'package:pruebastripe/pages/login/widgets/rounded_button.dart';
import 'package:pruebastripe/utils/app_colors.dart';
import 'package:pruebastripe/utils/responsive.dart';

class ForgotPasswordForm extends StatefulWidget {
  final VoidCallback onGoToLogin;

  const ForgotPasswordForm({Key key, @required this.onGoToLogin})
      : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool _agree = false;

  void _goTo(BuildContext context, FirebaseUser user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("error al iniciar sesión");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: Alignment.center,
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Recuperar contraseña",
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 25,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                  iconPath: "assets/pages/login/icons/correo-electronico.svg",
                  placeholder: "Correo Electronico"),
              SizedBox(
                height: responsive.ip(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.onGoToLogin,
                    child: Text("Regresar a login"),
                  ),
                  SizedBox(width: 10),
                  RoudedButton(
                    label: "Enviar",
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
