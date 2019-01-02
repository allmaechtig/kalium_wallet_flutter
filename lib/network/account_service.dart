import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kalium_wallet_flutter/network/wsclient.dart';

class AccountService {
  static final AccountService _singleton = new AccountService._internal();
  static AccountService get inst => _singleton;

  AccountService._internal() {
    // Init connection
    WebSocketsNotifications.inst.initCommunication();
    // Add listener
    WebSocketsNotifications.inst.addListener(_onMessageReceived);
  }

  // Invoked when server sends a message
  _onMessageReceived(message) {
    // Deserialize to json, `Map msg = json.decode(serverMessage);`
    // TODO - here we need to determine what type of message was sent and handle
    // it accordingly
    return;
  }

  send(String data) {
    WebSocketsNotifications.inst.send(json.encode({"data":data}));
  }

  /// ==========================================================
  ///
  /// Listeners to allow the different pages to be notified
  /// when messages come in
  ///
  ObserverList<Function> _listeners = new ObserverList<Function>();

  /// ---------------------------------------------------------
  /// Adds a callback to be invoked in case of incoming
  /// notification
  /// ---------------------------------------------------------
  addListener(Function callback){
    _listeners.add(callback);
  }
  removeListener(Function callback){
    _listeners.remove(callback);
  }
}