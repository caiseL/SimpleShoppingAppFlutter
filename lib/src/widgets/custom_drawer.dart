import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false);
            },
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("account");
            },
            title: Text(
              "Account",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.building,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("categories");
            },
            title: Text(
              "Departments",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.truck,
              color: Colors.black,
            ),
            onTap: () {},
            title: Text(
              "Deliveries",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            child: Text(
              "Configurations",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            onTap: () {},
            title: Text(
              "Payment",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.black),
            onTap: () {},
            title: Text(
              "Notifications",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
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
