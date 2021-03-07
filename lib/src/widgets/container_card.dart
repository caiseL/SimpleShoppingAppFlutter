import 'package:flutter/material.dart';
import 'package:shopping_app/src/models/product_model.dart';

class ContainerCard extends StatelessWidget {
  final Function nextPage;
  final List<Product> products;

  ContainerCard({@required this.nextPage, @required this.products});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        final _product = products[index];
        final borderRadius = 5.0;
        return GestureDetector(
          onTap: () {
            print(_product.title);

            Navigator.of(context).pushNamed("details", arguments: {_product});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20, horizontal: 10), // Mueve esto abajo
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Theme.of(context).focusColor,
                  width: 0.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: size.height * 0.24,
                          color: Theme.of(context).hintColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInImage(
                              placeholder:
                                  AssetImage("assets/images/no_photo.png"),
                              image: NetworkImage("${_product.image}"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: size.height * 0.24,
                          color: Theme.of(context).cardColor,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                child: Text(
                                  "${_product.title}",
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context).textTheme.headline6,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("\$${_product.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:
                                          _getNumberStars(_product, context),
                                    ),
                                  ),
                                ],
                              ), // Crear dos textos diferentes.
                              Text(
                                "${_product.description}",
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
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getNumberStars(Product product, BuildContext context) {
    List<Widget> widgetList = [];
    final int numberOfStars = product.rating.floor();
    for (int i = 0; i < numberOfStars; i++) {
      if (product.rating >= 1) {
        widgetList.add(
          Icon(Icons.star, color: Colors.yellow, size: 15.0),
        );
      }
    }

    widgetList.add(
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text("${product.rating}",
            style: Theme.of(context).textTheme.subtitle2),
      ),
    );

    return widgetList;
  }
}
