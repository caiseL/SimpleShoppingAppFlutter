import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 235, 250, 230),
        fontFamily: "Lato",
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 4, 3, 15),
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 4, 3, 15),
          ),
          subtitle2: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 4, 3, 15),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
      },
    );
  }
}
