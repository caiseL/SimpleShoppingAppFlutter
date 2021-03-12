import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: size.height * 0.15,
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
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0),
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
              style: Theme.of(context).textTheme.subtitle2,
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
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.tshirt,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("categories");
            },
            title: Text(
              "Categories",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.black,
            ),
            onTap: () {},
            title: Text(
              "Your favorites",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            onTap: () {
              Navigator.of(context).pushNamed("settings_page");
            },
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "About",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
