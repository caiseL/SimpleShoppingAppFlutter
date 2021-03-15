import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/providers/ui_provider.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title:
            Text('All Filters', style: Theme.of(context).textTheme.headline4),
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.times,
            color: Colors.black,
            size: 22.0,
          ),
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
          CustomCircleAvatar()
        ],
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UIProvider>(context);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [aaa(context, provider)]);
  }

  Widget aaa(BuildContext context, UIProvider provider) {
    Size size = MediaQuery.of(context).size;

    int currentIndex = provider.selectedIndex;
    List<String> info = ["\$", "\$\$", "\$\$\$", "\$\$\$\$"];
    return Container(
      height: size.height * 0.1,
      width: size.width,
      child: ListView.builder(
        itemCount: info.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              print("A");
              currentIndex = i;
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                backgroundColor:
                    currentIndex == i ? Colors.black : Colors.white,
                radius: 29.0,
                child: Text(info[i],
                    style: currentIndex == i
                        ? TextStyle(color: Colors.white, fontSize: 21.0)
                        : Theme.of(context).textTheme.headline5),
              ),
            ),
          );
        },
      ),
    );
  }
}
