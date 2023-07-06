import 'package:phonebook_auth/models/user_model.dart';
import 'package:phonebook_auth/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, LoginAction>(_loginUserReducer),
]);

UserModel _loginUserReducer(UserModel user, LoginAction action) {
  return action.loginResponse.user!;
}
