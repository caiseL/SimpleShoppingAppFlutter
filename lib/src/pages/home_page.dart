import 'package:flutter/material.dart';
import 'package:shoping_app/src/providers/product_provider.dart';
import 'package:shoping_app/src/widgets/container_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider futureProduct = ProductProvider();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.green[300],
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
                            fontStyle: FontStyle.italic, fontSize: 17.0),
                      )),
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
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.green[300]],
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(children: [
          Container(
            height: size.height * 0.25,
          ),
          FutureBuilder(
            future: futureProduct.getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ContainerCard(products: snapshot.data);
              } else {
                return Center(
                  child: RefreshProgressIndicator(
                    strokeWidth: 3.0,
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
