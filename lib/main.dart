import 'package:flutter/material.dart';
import 'package:shopping_app/src/pages/account_page.dart';
import 'package:shopping_app/src/pages/categories_page.dart';
import 'package:shopping_app/src/pages/home_page.dart';
import 'package:shopping_app/src/pages/product_images.dart';
import 'package:shopping_app/src/theme/theme_dart.dart';
import 'package:shopping_app/src/widgets/404_error_page.dart';
import 'package:shopping_app/src/widgets/my_behavior.dart';
import 'package:shopping_app/src/pages/product_details.dart';
import 'package:page_transition/page_transition.dart';

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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
                child: HomePage(), type: PageTransitionType.fade);
            break;
          case 'details':
            return PageTransition(
                child: ProductDetails(),
                type: PageTransitionType.fade,
                settings: settings);
            break;
          case 'error_page':
            return PageTransition(
                child: ErrorPage(), type: PageTransitionType.fade);
            break;
          case 'product_images':
            return PageTransition(
                child: ProductImages(),
                type: PageTransitionType.fade,
                settings: settings);
            break;
          case 'categories':
            return PageTransition(
                child: CategoriesPage(), type: PageTransitionType.fade);
            break;

          case 'account':
            return PageTransition(
                child: AccountPage(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
    );
  }
}
