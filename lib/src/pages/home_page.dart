import 'package:flutter/material.dart';
import 'package:shoping_app/src/providers/check_internet.dart';
import 'package:shoping_app/src/providers/product_provider.dart';
import 'package:shoping_app/src/widgets/container_card.dart';
import 'package:shoping_app/src/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider futureProduct = ProductProvider();
  bool connection;
  CheckInternet internet;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (connection) {
      return Scaffold(
        drawer: CustomDrawer(),
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
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: ListView(children: [
            Container(
              height: size.height * 0.25, // search bar?
            ),
            FutureBuilder(
              future: futureProduct.getProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ContainerCard(products: snapshot.data);
                } else {
                  return Container();
                }
              },
            ),
          ]),
        ),
      );
    }
    return noInternetConnection();
  }

  @override
  void initState() {
    super.initState();
    connection = CheckInternet().checkConnection(context);
  }

  @override
  void dispose() {
    super.dispose();
    CheckInternet().close();
  }

  Widget noInternetConnection() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text("ERROR 404"),
            Text("Sorry. You don't have an internet connection"),
            Text("You can't access this content right now"),
            Text("Try it later!"),
            Image.asset(
              "assets/images/loading.gif",
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
