import 'package:phonebook_auth/models/auth_response.dart';

// ThunkAction<AppState> getBoxColor(Completer completer) {
//   return (Store<AppState> store) async {
//     try {
//       MyBoxColor boxColor = await ApiClient.getBoxColor();
//       store.dispatch(SetColor(boxColor));
//       completer.complete();
//     } on ColorException catch (e) {
//       completer.completeError(e);
//     }
//   };
// }

class LoginAction {
  final AuthResponse _loginResponse;

  LoginAction({loginResponse}) : this._loginResponse = loginResponse;

  AuthResponse get loginResponse => _loginResponse;

  @override
  String toString() {
    return 'LoginResponseAction{_loginResponse: $_loginResponse}';
  }
}
