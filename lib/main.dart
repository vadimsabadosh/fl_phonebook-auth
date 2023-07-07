import 'package:flutter_redux/flutter_redux.dart';
import 'package:phonebook_auth/models/auth_state.dart';
import 'package:phonebook_auth/redux/actions/actions.dart';
import 'package:phonebook_auth/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'models/app_state.dart';
import 'redux/store/store.dart';
import 'ui/pages/tabs_page.dart';

void main() {
  runApp(StoreProvider(
    store: store,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Phonebook Auth Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFE91052),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Map<AuthStatus, Widget> screens = {
    AuthStatus.uninitialized: const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    ),
    AuthStatus.authenticated: const TabsPage(),
    AuthStatus.unauthenticated: const LoginPage()
  };

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, _ViewModel vm) {
        return screens[vm.status]!;
      },
      converter: (store) => _ViewModel.fromStore(store),
    );
  }
}

class _ViewModel {
  final AuthStatus status;
  final VoidCallback getUser;

  _ViewModel({required this.status, required this.getUser});

  factory _ViewModel.fromStore(Store<AppState> store) {
    return _ViewModel(
      status: store.state.auth.status!,
      getUser: () {
        store.dispatch(getCurrentUserAction());
      },
    );
  }
}
