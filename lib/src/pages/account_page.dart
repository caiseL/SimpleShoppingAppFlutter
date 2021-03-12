import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.075,
            ),
            Center(
              child: CircleAvatar(
                radius: size.height * 0.075,
                backgroundColor: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: (size.height * 0.1), top: (size.height * 0.025)),
              child: Text("Jeff Preston Bezos",
                  style: Theme.of(context).textTheme.headline5),
            ),
            Text("- Blah blah blah", style: TextStyle(fontSize: 21.0)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text("- Blah blah blah", style: TextStyle(fontSize: 21.0)),
            ),
            Text("- Blah blah blah", style: TextStyle(fontSize: 21.0)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text("- Blah blah blah", style: TextStyle(fontSize: 21.0)),
            ),
            Text("- Blah blah blah", style: TextStyle(fontSize: 21.0)),
          ],
        ));
  }
}
