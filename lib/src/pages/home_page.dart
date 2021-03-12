import 'package:flutter/material.dart';
import 'package:shopping_app/src/providers/product_provider.dart';
import 'package:shopping_app/src/widgets/404_error_page.dart';
import 'package:shopping_app/src/widgets/container_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopping_app/src/widgets/custom_drawer.dart';
import 'package:shopping_app/src/widgets/search_bar.dart';

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
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        futureProduct.getProducts();
      }
    });
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    if (connection) {
      return SafeArea(
        top: false,
        child: Scaffold(
          drawer: CustomDrawer(),
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  actionsIconTheme:
                      IconThemeData(color: Colors.black, size: 30.0),
                  backgroundColor: Color.fromARGB(0, 247, 247, 247),
                  leading: _avatarImage(_scaffoldKey),
                  actions: _actionsIcons(),
                ),
                SliverFillRemaining(
                  child: ListView(
                    controller: _controller,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: size.height * 0.25,
                        child: Text(
                          "The most popular clothes today",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SearchBar(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      StreamBuilder(
                        stream: futureProduct.productsStream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ContainerCard(
                                nextPage: futureProduct.getProducts,
                                products: snapshot.data);
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _avatarImage(_scaffoldKey) {
    return GestureDetector(
      onTap: () => _scaffoldKey.currentState.openDrawer(),
      child: Container(
        margin: EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => Image.asset(
                    "assets/images/no_photo.png",
                  ),
              imageUrl:
                  "https://media.gq.com.mx/photos/5f23041351bcbdbc95b13466/master/pass/JEFF.jpg"),
        ),
      ),
    );
  }

  List<Widget> _actionsIcons() {
    return [
      GestureDetector(
        child: Icon(Icons.tune_outlined, size: 30.0),
        onTap: () {
          //Show dialog
        },
      ),
      SizedBox(
        width: 7.5,
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
          Positioned(
            top: 2.5,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3.0),
                shape: BoxShape.circle,
                color: Theme.of(context).accentColor,
              ),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "2",
                  textScaleFactor: 0.8,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
