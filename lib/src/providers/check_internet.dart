import 'dart:async';

import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class CheckInternet {
  StreamSubscription<DataConnectionStatus> listener;

  void close() {
    listener.cancel();
  }

  checkConnection(BuildContext context) async {
    listener = DataConnectionChecker().onStatusChange.listen(
      (status) {
        print(status);
      },
    );
    return await DataConnectionChecker().connectionStatus;
  }
}
