import 'package:phonebook_auth/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../reducers/app_reducer.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: [new LoggingMiddleware.printer(), thunkMiddleware],
);
