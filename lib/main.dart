import 'package:flutter/material.dart';
import 'package:shopping_app/src/pages/account_page/account_page.dart';
import 'package:shopping_app/src/pages/categories_page.dart';
import 'package:shopping_app/src/pages/account_page/change_profile_page.dart';
import 'package:shopping_app/src/pages/home_page.dart';
import 'package:shopping_app/src/pages/product_details/product_images.dart';
import 'package:shopping_app/src/pages/settings_page.dart';
import 'package:shopping_app/src/theme/theme_dart.dart';
import 'package:shopping_app/src/widgets/404_error_page.dart';
import 'package:shopping_app/src/widgets/full_screen_dialog.dart';
import 'package:shopping_app/src/widgets/my_behavior.dart';
import 'package:shopping_app/src/pages/product_details/product_details.dart';
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
          case 'error_page':
            return PageTransition(
                child: ErrorPage(), type: PageTransitionType.fade);
            break;
          case 'details':
            return PageTransition(
                child: ProductDetails(),
                type: PageTransitionType.fade,
                settings: settings);
            break;
          case 'details/product_images':
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
          case 'account/change_profile':
            return PageTransition(
                child: ChangeProfilePage(), type: PageTransitionType.fade);
            break;
          case 'settings_page':
            return PageTransition(
                child: SettingsPage(), type: PageTransitionType.fade);
          case 'full_screen_dialog':
            return PageTransition(
                child: FullScreenDialog(),
                type: PageTransitionType.bottomToTop);
          default:
            return null;
        }
      },
    );
  }
}
