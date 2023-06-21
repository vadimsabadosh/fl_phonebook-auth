import 'package:phonebook_auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/tabs_page.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<AuthStatus, StatefulWidget> screens = {
    AuthStatus.uninitialized: const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    ),
    AuthStatus.authenticated: const TabsPage(),
    AuthStatus.unauthenticated: const LoginPage()
  };

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthProvider>().status;
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
