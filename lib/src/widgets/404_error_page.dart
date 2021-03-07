import 'package:flutter/material.dart';

import 'blink_icon.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/icon2.png",
              height: 150,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            BlinkIcon(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "ERROR 404",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Something went wrong!",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text("You can't access this content right now",
                style: Theme.of(context).textTheme.headline5),
            Text("Please try again later!",
                style: Theme.of(context).textTheme.headline5),
            SizedBox(
              height: size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
