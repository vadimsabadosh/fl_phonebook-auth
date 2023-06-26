import 'package:flutter/widgets.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
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
      final user = await _authService.getCurrentUser();
      if (user != null) {
        _status = AuthStatus.authenticated;
        _currentUser = user.user;
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
      var resp = await _authService.login(email: email, password: password);
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
      final user = await _authService.register(
        email: email,
        password: password,
        name: name,
      );
      if (user != null) {
        _status = AuthStatus.authenticated;
        _currentUser = user.user;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      _status = AuthStatus.unauthenticated;
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }
}
