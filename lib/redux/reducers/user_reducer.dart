import 'package:phonebook_auth/models/auth_state.dart';
import 'package:phonebook_auth/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, UserSuccessAction>(_loginUserReducer),
  TypedReducer<AuthState, UserErrorAction>(_loginUserErrorReducer),
  TypedReducer<AuthState, UserPendingAction>(_loginUserPendingReducer),
  TypedReducer<AuthState, UserSuccessAction>(_getCurrentUserReducer),
  TypedReducer<AuthState, UserErrorAction>(_getCurrentUserErrorReducer),
  TypedReducer<AuthState, UserPendingAction>(_getCurrentUserPendingReducer),
]);

AuthState _loginUserReducer(AuthState auth, UserSuccessAction action) {
  return AuthState(
      user: action.response.user,
      token: action.response.token,
      isLoading: false,
      status: AuthStatus.authenticated);
}

AuthState _loginUserErrorReducer(AuthState auth, UserErrorAction action) {
  return AuthState(
      isLoading: false,
      error: action.error,
      status: AuthStatus.unauthenticated);
}

AuthState _loginUserPendingReducer(AuthState auth, UserPendingAction action) {
  return AuthState(isLoading: true, status: AuthStatus.uninitialized);
}

AuthState _getCurrentUserReducer(AuthState auth, UserSuccessAction action) {
  return AuthState(
      user: action.response.user,
      token: action.response.token,
      isLoading: false,
      status: AuthStatus.authenticated);
}

AuthState _getCurrentUserErrorReducer(AuthState auth, UserErrorAction action) {
  return AuthState(
      isLoading: false,
      error: action.error,
      status: AuthStatus.unauthenticated);
}

AuthState _getCurrentUserPendingReducer(
    AuthState auth, UserPendingAction action) {
  return AuthState(isLoading: true, status: AuthStatus.uninitialized);
}
