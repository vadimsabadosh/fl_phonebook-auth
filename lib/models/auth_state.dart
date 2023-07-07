// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'user_model.dart';

enum AuthStatus { uninitialized, authenticated, unauthenticated }

class AuthState {
  UserModel? user;
  String? token;
  bool? isLoading = false;
  String? error;
  AuthStatus? status = AuthStatus.unauthenticated;

  AuthState({
    this.user,
    this.token,
    this.isLoading,
    this.error,
    this.status,
  });

  factory AuthState.init() {
    return AuthState(status: AuthStatus.unauthenticated);
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
        'isLoading': isLoading,
        'error': error,
        'status': status,
      };

  @override
  String toString() => 'AuthState(user: $user, token: $token)';
}
