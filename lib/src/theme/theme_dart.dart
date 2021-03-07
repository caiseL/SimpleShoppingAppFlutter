import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    fontFamily: "Lato",

    backgroundColor: Color.fromARGB(
        255, 235, 250, 230), // Color of... you know.. the background
    cardColor:
        Colors.white, // Color of the container around info of the product
    accentColor: Colors.blue, // Color of bottom right gradient and drawer
    primaryColor: Colors.grey, // Color of top left gradient
    focusColor: Colors.grey, // Color of border radius of Card
    hintColor: Colors.grey, // Color border product
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
  );
}
