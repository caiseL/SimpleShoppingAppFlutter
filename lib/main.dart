import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "login-page": (BuildContext context) => LoginPage(),
      },
    );
  }
}
