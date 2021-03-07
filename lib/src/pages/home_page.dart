import 'package:flutter/material.dart';
import 'package:shopping_app/src/providers/product_provider.dart';
import 'package:shopping_app/src/widgets/blink_icon.dart';
import 'package:shopping_app/src/widgets/container_card.dart';
import 'package:shopping_app/src/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider futureProduct = ProductProvider();
  bool connection = true;
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (connection) {
      return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Image.asset(
            "assets/icon/icon2.png",
            height: 75,
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
          child: SingleChildScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25, // search bar?
                ),
                StreamBuilder(
                  stream: futureProduct.productsStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ContainerCard(
                          products: snapshot.data,
                          nextPage: futureProduct.getProducts);
                    } else {
                      return Center(
                        child: Image.asset("assets/images/loading.gif",
                            height: size.height * 0.25),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
    return noInternetConnection();
  }

  @override
  void initState() {
    super.initState();
    futureProduct.getProducts(); // O justo abajo del build

    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        futureProduct.getProducts();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget noInternetConnection() {
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
