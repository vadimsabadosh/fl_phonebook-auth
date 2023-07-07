// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'user_model.dart';

class AuthResponse {
  UserModel? user;
  String? token;

  AuthResponse({this.user, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };

  @override
  String toString() => 'AuthResponse(user: $user, token: $token)';
}
