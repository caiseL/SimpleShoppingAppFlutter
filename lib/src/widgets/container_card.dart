import 'package:flutter/material.dart';
import 'package:shoping_app/src/models/product_model.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key key, @required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Container(
            color: Colors.blue,
            child: Wrap(
              children: [
                Container(
                  color: Colors.green,
                  child: FadeInImage(
                      height: size.height * 0.25,
                      placeholder: AssetImage("assets/images/loading.gif"),
                      image: NetworkImage("${product.image}")),
                ),
                Container(
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.title}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text("${product.price}")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
