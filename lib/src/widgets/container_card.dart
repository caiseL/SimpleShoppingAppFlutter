import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key key, @required this.products}) : super(key: key);
  final List<dynamic> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
    );
  }
}
