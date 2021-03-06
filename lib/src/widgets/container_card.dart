import 'package:flutter/material.dart';
import 'package:shoping_app/src/models/product_model.dart';

import 'products_info.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key key, @required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            print(index);
            ProductInfo(product: products[index]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Container(
              height: size.height * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Color.fromARGB(230, 230, 250, 235),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: FadeInImage(
                        height: size.height * 0.21,
                        placeholder: AssetImage("assets/images/loading.gif"),
                        image: NetworkImage("${product.image}"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            child: Text(
                              "${product.title}",
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.headline6,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("\$${product.price}",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 15.0),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 15.0),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 15.0),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 15.0),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 15.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text("${product.rating}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ), // Crear dos textos diferentes.
                          Text(
                            "${product.description}",
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
