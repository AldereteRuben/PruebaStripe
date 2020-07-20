import 'package:flutter/material.dart';
import 'package:pruebastripe/libs/auth.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              Auth.instance.logOut(context);
            },
            child: Text('Cerrar Sesión')),
      ),
    );
  }
}
