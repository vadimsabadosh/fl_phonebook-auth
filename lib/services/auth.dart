import 'api.dart';

class AuthApiImp implements AuthApi {
  final String url = 'https://connections-api.herokuapp.com/';

  @override
  Future<void> login({required String email, required String password}) async {
    // TODO: implement login
  }

  @override
  Future<void> getCurrentUser() async {
    // TODO: implement getCurrentUser
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
  }

  @override
  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    // TODO: implement register
  }
}
