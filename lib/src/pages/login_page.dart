import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: size.height * 0.4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: _inputField(),
          ),
        ],
      ),
    );
  }

  Widget _inputField() {
    return TextField(
      autofocus: true,
    );
  }
}
