import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pruebastripe/pages/login/widgets/login_form.dart';
import 'package:pruebastripe/pages/login/widgets/welcome.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Welcome(), LoginForm()],
        ),
      ),
    );
  }
}
