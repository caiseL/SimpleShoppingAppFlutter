import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/src/providers/ui_provider.dart';

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({Key key}) : super(key: key);

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  UIProvider provider = UIProvider();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title:
            Text('All Filters', style: Theme.of(context).textTheme.headline4),
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.times),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Sort", style: Theme.of(context).textTheme.headline4),
          ),
          ListTile(
              horizontalTitleGap: 0.0,
              trailing: Icon(Icons.check),
              onTap: () {},
              leading: FaIcon(FontAwesomeIcons.fire),
              title: Text("Most popular (default)")),
          ListTile(
              horizontalTitleGap: 0.0,
              trailing: null,
              onTap: () {},
              leading: FaIcon(FontAwesomeIcons.solidStar),
              title: Text("Rating")),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Price range",
                style: Theme.of(context).textTheme.headline4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildCircleAvatar(context),
          )
        ],
      ),
    );
  }

  List<Widget> _buildCircleAvatar(BuildContext context) {
    List<Widget> avatars = [];
    List<String> info = ["\$", "\$\$", "\$\$\$", "\$\$\$\$"];

    for (int i = 0; i < 4; i++) {
      avatars.add(
        GestureDetector(
          onTap: () {
            provider.selectedIndex = i;
            setState(() {});
          },
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor:
                  provider.selectedIndex == i ? Colors.black : Colors.white,
              radius: 29.0,
              child: Text(info[i],
                  style: provider.selectedIndex == i
                      ? TextStyle(color: Colors.white, fontSize: 21.0)
                      : Theme.of(context).textTheme.headline5),
            ),
          ),
        ),
      );
    }
    return avatars;
  }
}
