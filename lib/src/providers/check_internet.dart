import 'dart:io';

import 'package:flutter/material.dart';

class CheckInternet {
  bool connection;

  checkConnection(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("TRUE");
        connection = true;
      }
    } on SocketException catch (_) {
      print("false");
      connection = false;
    }
    return connection;
  }
}
