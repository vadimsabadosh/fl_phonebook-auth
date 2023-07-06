import 'package:phonebook_auth/models/app_state.dart';

import 'user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(user: userReducer(state.user, action), contacts: []);
}
