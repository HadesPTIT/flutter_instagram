import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as dev;

///
/// https://pub.dev/packages/connectivity/example
///
mixin NetworkStateMixin {
  static const TAG = 'NetworkStateMixin';
  final Connectivity _connectivity = Connectivity();

  Future<bool> checkNetwork() async {
    dev.log('startNetworkListening');
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      dev.log('Error ${e.message}', name: TAG);
    }
    dev.log('startNetworkListening result $result');
    return Future.value(result != ConnectivityResult.none);
  }
}
