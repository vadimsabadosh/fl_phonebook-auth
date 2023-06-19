abstract class AuthApi {
  Future<void> login({required String email, required String password}) async {}
  Future<void> logout() async {}
  Future<void> getCurrentUser() async {}
  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {}
}

abstract class ContactsApi {
  Future<void> getContacts() async {}
  Future<void> createContact(
      {required String name, required String number}) async {}
  Future<void> deleteContact({required String id}) async {}
  Future<void> updateContact({required String id}) async {}
}
