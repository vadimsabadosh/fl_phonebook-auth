import 'package:flutter/widgets.dart';

import '../models/user_model.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthAPI extends ChangeNotifier {
  // late final Account account;

  UserModel? _currentUser;

  AuthStatus _status = AuthStatus.uninitialized;

  // Getter methods
  UserModel? get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get username => _currentUser?.name;
  String? get email => _currentUser?.email;
  String? get userid => _currentUser?.id;

  // Constructor
  AuthAPI() {
    init();
    loadUser();
  }

  // Initialize the Appwrite client
  init() {
    // client
    //     .setEndpoint(APPWRITE_URL)
    //     .setProject(APPWRITE_PROJECT_ID)
    //     .setSelfSigned();
    // account = Account(client);
  }

  loadUser() async {
    try {
      // final user = await account.get();
      // _status = AuthStatus.authenticated;
      _status = AuthStatus.unauthenticated;
      // _currentUser = user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      // final user = await account.create(
      //   email: email,
      //   password: password,
      //   name: 'Simon G',
      // );
      // return user;
    } finally {
      notifyListeners();
    }
  }

  Future<void> createEmailSession(
      {required String email, required String password}) async {
    try {
      // final session =
      //     await account.createEmailSession(email: email, password: password);
      // _currentUser = await account.get();
      _status = AuthStatus.authenticated;
    } finally {
      notifyListeners();
    }
  }

  signOut() async {
    try {
      // await account.deleteSession(sessionId: 'current');
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }
}
