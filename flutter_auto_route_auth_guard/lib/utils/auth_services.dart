import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  AuthService._();
  static final AuthService _singleton = AuthService._();
  factory AuthService() {
    return _singleton;
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool value) {
    print('AuthService set isAuthenticated');
    _isAuthenticated = value;
    notifyListeners();
  }
}
