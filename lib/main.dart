import 'package:phonebook_auth/pages/login_page.dart';
import 'package:phonebook_auth/pages/phonebook_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_api.dart';

void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
      create: (context) => AuthAPI(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthAPI>().status;
    print('Initialize $value');
    return MaterialApp(
        title: 'Appwrite Auth Demo',
        debugShowCheckedModeBanner: false,
        home: value == AuthStatus.uninitialized
            ? const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : value == AuthStatus.authenticated
                ? const PhonebookPage()
                : const LoginPage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFE91052),
          ),
        ));
  }
}
