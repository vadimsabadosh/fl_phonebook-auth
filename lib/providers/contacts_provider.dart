import 'package:flutter/widgets.dart';
import 'package:phonebook_auth/models/contact_model.dart';
import '../services/contacts_service.dart';

class ContactsProvider extends ChangeNotifier {
  bool _isLoading = false;
  final ContactsService _contactsService = ContactsService();
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;
  bool get isLoading => _isLoading;

  ContactsProvider() {
    getContacts();
  }

  Future<void> getContacts() async {
    try {
      _isLoading = true;
      List<ContactModel> contacts = await _contactsService.getContacts();
      _contacts = contacts;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createContact(
      {required String name, required String number}) async {
    try {
      ContactModel contact =
          await _contactsService.createContact(name: name, number: number);
      _contacts = [contact, ..._contacts];
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteContact({required String id}) async {
    try {
      ContactModel contact = await _contactsService.deleteContact(id: id);
      _contacts = _contacts.where((c) => c.id != contact.id).toList();
    } finally {
      notifyListeners();
    }
  }

  // Future<void> register(
  //     {required String email,
  //     required String password,
  //     required String name}) async {
  //   try {
  //     final user = await authService.register(
  //       email: email,
  //       password: password,
  //       name: name,
  //     );
  //     if (user != null) {
  //       _status = AuthStatus.authenticated;
  //       _currentUser = user.user;
  //     }
  //   } catch (e) {
  //     _status = AuthStatus.unauthenticated;
  //     throw Exception(e);
  //   } finally {
  //     notifyListeners();
  //   }
  // }

  // Future<void> logout() async {
  //   try {
  //     await authService.logout();
  //     _status = AuthStatus.unauthenticated;
  //   } catch (e) {
  //     throw Exception(e);
  //   } finally {
  //     notifyListeners();
  //   }
  // }
}
