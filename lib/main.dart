import 'package:flutter/material.dart';
import 'package:shopping_app/src/theme/theme_dart.dart';
import 'package:shopping_app/src/widgets/my_behavior.dart';
import 'package:shopping_app/src/pages/product_details.dart';

import 'src/pages/home_page.dart';
import 'src/widgets/404_error_page.dart';
import 'src/pages/product_images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          child: child,
          behavior: MyBehavior(),
        );
      },
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "details": (BuildContext context) => ProductDetails(),
        "error_page": (BuildContext context) => ErrorPage(),
        "product_images": (BuildContext context) => ProductImages(),
      },
    );
  }
}
