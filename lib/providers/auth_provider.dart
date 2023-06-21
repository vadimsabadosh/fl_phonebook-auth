import 'dart:js_interop';
import 'package:flutter/widgets.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  UserModel? _currentUser;
  AuthStatus _status = AuthStatus.uninitialized;

  UserModel? get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get username => _currentUser?.name;
  String? get email => _currentUser?.email;

  AuthProvider() {
    loadUser();
  }

  loadUser() async {
    try {
      final user = await authService.getCurrentUser();
      if (user.isDefinedAndNotNull) {
        _status = AuthStatus.authenticated;
        _currentUser = user?.user;
      } else {
        _status = AuthStatus.unauthenticated;
        _currentUser = null;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      var resp = await authService.login(email: email, password: password);
      _currentUser = resp.user;
      _status = AuthStatus.authenticated;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await authService.register(
        email: email,
        password: password,
        name: name,
      );
      _status = AuthStatus.authenticated;
      _currentUser = user.user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await authService.logout();
      _status = AuthStatus.unauthenticated;
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }
}
