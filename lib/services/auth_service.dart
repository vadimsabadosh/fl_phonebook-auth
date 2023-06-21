import 'dart:convert';
import 'dart:js_interop';

import 'package:phonebook_auth/models/auth_response.dart';

import 'api.dart';
import "package:http/http.dart" as http;

import 'sercure_storage_service.dart';

class AuthService implements AuthApi {
  final String url = 'https://connections-api.herokuapp.com/users';

  saveToken(String? token) {
    SecureStorageService.storage
        .write(key: SecureStorageService.key, value: token);
  }

  Map<String, String> buildHeaders({String? accessToken}) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  @override
  Future<AuthResponse> login(
      {required String email, required String password}) async {
    Uri loginUrl = Uri.parse('$url/login');
    var response = await http.post(
      loginUrl,
      headers: buildHeaders(),
      body: jsonEncode({"email": email, "password": password}),
    );
    AuthResponse decoded = AuthResponse.fromJson(jsonDecode(response.body));
    saveToken(decoded.token);
    return decoded;
  }

  Future<AuthResponse> _loadUser(String token) async {
    Uri loginUrl = Uri.parse('$url/current');
    var response = await http.get(
      loginUrl,
      headers: buildHeaders(accessToken: token),
    );
    AuthResponse decoded = AuthResponse.fromJson(jsonDecode(response.body));
    saveToken(decoded.token);
    return decoded;
  }

  @override
  Future<AuthResponse?> getCurrentUser() async {
    var token =
        SecureStorageService.storage.read(key: SecureStorageService.key);
    if (token.isNull) {
      return null;
    }
    return _loadUser(token.toString());
  }

  @override
  Future<void> logout() async {
    var token =
        SecureStorageService.storage.read(key: SecureStorageService.key);
    if (token.isNull) {
      throw Exception('No token provided');
    }
    Uri loginUrl = Uri.parse('$url/logout');
    var response = await http.post(
      loginUrl,
      headers: buildHeaders(accessToken: token.toString()),
    );
    AuthResponse decoded = AuthResponse.fromJson(jsonDecode(response.body));
    saveToken(decoded.token);
  }

  @override
  Future<AuthResponse> register(
      {required String email,
      required String password,
      required String name}) async {
    Uri loginUrl = Uri.parse('$url/signup');
    var response = await http.post(
      loginUrl,
      headers: buildHeaders(),
      body: jsonEncode({"email": email, "password": password, "name": name}),
    );
    AuthResponse decoded = AuthResponse.fromJson(jsonDecode(response.body));
    saveToken(decoded.token);
    return decoded;
  }
}