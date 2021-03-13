import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shopping_app/src/models/product_model.dart';

class CustomSwiper extends StatelessWidget {
  final Product product;
  const CustomSwiper({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      onTap: (index) {
        Navigator.of(context).pushNamed("details/product_images",
            arguments: [index, product.images]);
      },
      index: 0,
      itemCount: product.images.length,
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
            color: Theme.of(context).backgroundColor,
            activeColor: Colors.black),
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder: AssetImage("assets/images/no_photo.png"),
              image: NetworkImage("${product.images[index]}"),
            ),
          );
        }
        return FadeInImage(
          placeholder: AssetImage("assets/images/no_photo.png"),
          image: NetworkImage("${product.images[index]}"),
        );
      },
    );
  }
}
