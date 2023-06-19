import 'api.dart';

class ContactsApiImp implements ContactsApi {
  final String url = 'https://connections-api.herokuapp.com/';

  @override
  Future<void> createContact(
      {required String name, required String number}) async {
    // TODO: implement createContact
    throw UnimplementedError();
  }

  @override
  Future<void> deleteContact({required String id}) async {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<void> getContacts() async {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

  @override
  Future<void> updateContact({required String id}) async {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
