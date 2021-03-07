import 'package:flutter/material.dart';

class BlinkIcon extends StatefulWidget {
  @override
  _BlinkIconState createState() => _BlinkIconState();
}

class _BlinkIconState extends State<BlinkIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeTransition(
        opacity: _animationController,
        child: Icon(
          Icons.wifi_off,
          size: size.height * 0.1,
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
