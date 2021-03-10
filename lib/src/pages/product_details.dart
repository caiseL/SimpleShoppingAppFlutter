import 'package:flutter/material.dart';
import 'package:shopping_app/src/models/product_model.dart';
import 'package:shopping_app/src/widgets/custom_swiper.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = true; // DB user

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.all(25.0),
        width: size.width,
        height: size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("${product.title}",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5),
                ),
                Text("\$${product.price}",
                    style: Theme.of(context).textTheme.headline5)
              ],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        titleTextStyle: Theme.of(context).textTheme.headline5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        title: Text(
                          "Description",
                        ),
                        contentPadding: EdgeInsets.all(20.0),
                        children: [
                          Text("${product.description}",
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyText1),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 15.0, top: 5.0),
                            child: TextButton(
                              child: Text("OK",
                                  style: Theme.of(context).textTheme.headline5),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
                child: Text(
                  "${product.description}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Text("Color", style: Theme.of(context).textTheme.subtitle2),
            Container(
                alignment: Alignment.center,
                height: size.height * 0.1,
                child: getColors(product)),
            Text("Size", style: Theme.of(context).textTheme.subtitle2),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: size.height * 0.1,
                child: getSizes(product),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: size.height * 0.1,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _appBar(context, product),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, Product product) {
    Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      iconTheme: IconThemeData(size: 27.0, color: Colors.black),
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: isFavorite
                ? Icon(Icons.thumb_up)
                : Icon(Icons.thumb_up_outlined),
          ),
        ),
      ],
      backgroundColor: Theme.of(context).focusColor,
      expandedHeight: size.height * 0.375,
      elevation: 2.0,
      floating: false,
      pinned: true,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back_rounded),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: CustomSwiper(product: product),
      ),
    );
  }

  Widget getColors(Product product) {
    Map<String, Color> colors = {
      "black".toLowerCase(): Colors.black,
      "white".toLowerCase(): Colors.white,
      "blue".toLowerCase(): Colors.blue,
      "red".toLowerCase(): Colors.red,
      "orange".toLowerCase(): Colors.orange,
      "green".toLowerCase(): Colors.green,
    };
    // List _colorsAvailable = ["green", "orange", "red"];
    final _colorsAvailable = product.colors;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: _colorsAvailable.length,
      itemBuilder: (BuildContext context, index) {
        final _color = _colorsAvailable[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            selected: false,
            backgroundColor: Colors.transparent,
            avatar: CircleAvatar(
              backgroundColor: colors[_color],
            ),
            label: Text(
                _color.toString().replaceFirst(
                    _color[0], _color[0].toString().toUpperCase()),
                style: Theme.of(context).textTheme.subtitle2),
          ),
        );
      },
    );
  }

  Widget getSizes(Product product) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: product.sizes.length,
      itemBuilder: (BuildContext context, index) {
        final _size = product.sizes[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            selected: false,
            backgroundColor: Colors.transparent,
            label: Text("$_size", style: Theme.of(context).textTheme.subtitle2),
          ),
        );
      },
    );
  }
}
