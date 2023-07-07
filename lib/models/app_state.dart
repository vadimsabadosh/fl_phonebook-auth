// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:phonebook_auth/models/auth_response.dart';

import 'auth_state.dart';
import 'contact_model.dart';
import 'user_model.dart';

@immutable
class AppState {
  final AuthState auth;
  final List<ContactModel> contacts;
  const AppState({
    required this.auth,
    required this.contacts,
  });

  factory AppState.init() => AppState(auth: AuthState.init(), contacts: []);

  AppState copyWith({
    UserModel? user,
    List<ContactModel>? contacts,
  }) {
    return AppState(
      auth: auth ?? this.auth,
      contacts: contacts ?? this.contacts,
    );
  }
}
