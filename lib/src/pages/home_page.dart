import 'package:flutter/material.dart';
import 'package:shoping_app/src/models/product_model.dart';
import 'package:shoping_app/src/providers/product_provider.dart';
import 'package:shoping_app/src/widgets/container_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Product> futureProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ContainerCard(products: snapshot.data);
            } else {
              return Center(
                child: RefreshProgressIndicator(
                  strokeWidth: 3,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureProduct = getProducts();
  }
}
