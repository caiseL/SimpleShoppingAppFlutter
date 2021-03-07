import 'package:flutter/material.dart';
import 'package:shopping_app/src/providers/product_provider.dart';
import 'package:shopping_app/src/widgets/404_error_page.dart';
import 'package:shopping_app/src/widgets/container_card.dart';
import 'package:shopping_app/src/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider futureProduct = ProductProvider();
  ScrollController _controller = ScrollController();

  bool connection = true;
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
    return ErrorPage();
  }

  @override
  void initState() {
    super.initState();
    futureProduct.getProducts();

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
}
