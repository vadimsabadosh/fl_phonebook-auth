import 'package:phonebook_auth/models/app_state.dart';
import 'package:phonebook_auth/models/auth_response.dart';
import 'package:phonebook_auth/services/auth_service.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginAction(String email, String password) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(UserPendingAction());
      AuthResponse? response =
          await AuthService().login(email: email, password: password);
      if (response != null) {
        store.dispatch(UserSuccessAction(response));
        return;
      }
      store.dispatch(UserErrorAction('Login failed'));
    } catch (e) {
      store.dispatch(UserErrorAction(e.toString()));
    }
  };
}

ThunkAction<AppState> getCurrentUserAction() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(UserPendingAction());
      AuthResponse? response = await AuthService().getCurrentUser();
      print('getCurrentUserAction response $response');
      if (response != null) {
        store.dispatch(UserSuccessAction(response));
        return;
      }
      store.dispatch(UserErrorAction('No user'));
    } catch (e) {
      store.dispatch(UserErrorAction(e.toString()));
    }
  };
}

class UserSuccessAction {
  final AuthResponse response;

  UserSuccessAction(this.response);

  @override
  String toString() {
    return 'UserSuccessAction{response: $response}';
  }
}

class UserErrorAction {
  final String error;

  UserErrorAction(this.error);

  @override
  String toString() {
    return 'UserErrorAction{error: $error}';
  }
}

class UserPendingAction {}
