import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivity {
  static final InternetConnectivity _instance =
      InternetConnectivity._internal();

  factory InternetConnectivity() => _instance;

  final InternetConnectionChecker _connectionChecker =
      InternetConnectionChecker.instance;
  final StreamController<bool> _connectionStreamController =
      StreamController<bool>.broadcast();

  InternetConnectivity._internal() {
    _connectionChecker.onStatusChange.listen((status) {
      bool isConnected = status == InternetConnectionStatus.connected;
      _connectionStreamController.add(isConnected);
    });
  }

  Future<bool> get isConnected async => await _connectionChecker.hasConnection;

  Stream<bool> get onConnectivityChanged => _connectionStreamController.stream;

  void dispose() {
    _connectionStreamController.close();
  }
}
