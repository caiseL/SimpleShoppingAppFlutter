import 'package:flutter/material.dart';
import 'package:shopping_app/src/models/product_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(context, product),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${product.title}",
                              style: Theme.of(context).textTheme.headline5),
                          Text("\$${product.price}",
                              style: Theme.of(context).textTheme.headline5)
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            "${product.description}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Text(
                        "Color",
                      ),
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 10.0),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            );
                          }),
                      Row(
                        children: [],
                      ),
                      Text("Size"),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, Product product) {
    Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      iconTheme: IconThemeData(size: 27.0, color: Colors.black),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.thumb_up_outlined),
        ),
      ],
      backgroundColor: Theme.of(context).focusColor,
      expandedHeight: size.height * 0.4,
      elevation: 2.0,
      floating: false,
      leading: Icon(Icons.arrow_back_outlined),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Swiper(
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Theme.of(context).focusColor, activeColor: Colors.black),
          ),
          itemCount: product.images.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              placeholder: AssetImage("assets/images/no_photo.png"),
              image: NetworkImage("${product.images[index]}"),
            );
          },
        ),
      ),
    );
  }
}
