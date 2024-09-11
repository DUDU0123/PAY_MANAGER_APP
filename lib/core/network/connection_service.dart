import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:payee_info/core/utils/message_show_helper.dart';
class ConnectionService {
  static final ConnectionService _instance = ConnectionService._internal();
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  GlobalKey<NavigatorState>? _navigatorKey;

  ConnectionService._internal();

  factory ConnectionService() {
    return _instance;
  }

  void initialize(GlobalKey<NavigatorState>? navigatorKey) {
    _navigatorKey = navigatorKey;
    _subscription = connectivityStream.listen(_handleConnectivityChange);
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<bool> isInternetConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (results.isNotEmpty) {
      bool isConnected = results.first != ConnectivityResult.none;
      _showConnectivitySnackBar(isConnected);
    }
  }

  void _showConnectivitySnackBar(bool isConnected) {
    if (_navigatorKey?.currentContext != null) {
      if (!isConnected) {
        MessageShowHelper.showSnackbar(
          context: _navigatorKey!.currentContext!,
          snackBarContent: "Please check your internet connection",
        );
      }
    }
  }
}
