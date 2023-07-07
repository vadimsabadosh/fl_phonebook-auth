import 'package:phonebook_auth/models/app_state.dart';

import 'user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(auth: userReducer(state.auth, action), contacts: []);
}
