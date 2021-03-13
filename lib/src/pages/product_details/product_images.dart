import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> info = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        child: Swiper(
          index: info[0],
          itemCount: info[1].length,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey, activeColor: Colors.white),
          ),
          itemBuilder: (context, index) {
            return Container(
              child: PhotoView(
                imageProvider: NetworkImage("${info[1][index]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
