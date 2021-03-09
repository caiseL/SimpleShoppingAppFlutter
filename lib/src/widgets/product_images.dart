import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> images = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
        itemCount: images.length,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Theme.of(context).focusColor, activeColor: Colors.black),
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: PhotoView(
              imageProvider: NetworkImage("${images[index]}"),
            ),
          );
        },
      ),
    );
  }
}
