import 'package:flutter_redux/flutter_redux.dart';
import 'package:phonebook_auth/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'redux/store/store.dart';
import 'ui/pages/tabs_page.dart';

void main() {
  runApp(StoreProvider(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, StatefulWidget> screens = {
    "uninitialized": const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    ),
    "authenticated": const TabsPage(),
    "unauthenticated": const LoginPage()
  };
  @override
  Widget build(BuildContext context) {
    var value = "unauthenticated";
    return MaterialApp(
        title: 'Phonebook Auth Demo',
        debugShowCheckedModeBanner: false,
        home: screens[value],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFE91052),
          ),
        ));
  }
}
