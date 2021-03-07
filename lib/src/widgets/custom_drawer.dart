import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.person_outline,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    "Hello, {userNameFirstName}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0),
                  ),
                ),
              ]),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Deliveries",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Account",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Departments",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(
            thickness: 1.5,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "PROGRAMS AND CHARACTERISTICS",
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Payment",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Promotions",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(
            thickness: 1.5,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Notifications",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "About",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
