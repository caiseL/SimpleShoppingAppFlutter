import 'package:flutter/material.dart';
import 'package:shopping_app/src/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(product.title),
      ),
    );
  }
}
