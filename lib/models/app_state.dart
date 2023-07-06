// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meta/meta.dart';

import 'contact_model.dart';
import 'user_model.dart';

@immutable
class AppState {
  final UserModel user;
  final List<ContactModel> contacts;
  const AppState({
    required this.user,
    required this.contacts,
  });

  factory AppState.init() => AppState(user: UserModel.init(), contacts: []);

  @override
  String toString() {
    return 'MyBoxColor: ${JsonEncoder.withIndent('  ').convert(this)}';
  }

  AppState copyWith({
    UserModel? user,
    List<ContactModel>? contacts,
  }) {
    return AppState(
      user: user ?? this.user,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toJson(),
      'contacts': contacts.map((x) => x.toJson()).toList(),
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      user: UserModel.fromJson(map['user'] as Map<String, dynamic>),
      contacts: List<ContactModel>.from(
        (map['contacts'] as List<int>).map<ContactModel>(
          (x) => ContactModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);
}
