import '../models/contact_model.dart';
import 'api.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

import 'sercure_storage_service.dart';

class ContactsService implements ContactsApi {
  final String url = 'https://connections-api.herokuapp.com/contacts';

  Map<String, String> _buildHeaders({required String accessToken}) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $accessToken'
    };

    return headers;
  }

  Future<String> _getToken() async {
    var token =
        await SecureStorageService.storage.read(key: SecureStorageService.key);
    print('token from storage: $token');
    if (token == null) {
      throw Exception('No token provided');
    }
    return token;
  }

  @override
  Future<ContactModel> createContact(
      {required String name, required String number}) async {
    var token = await _getToken();
    var response = await http.post(
      Uri.parse(url),
      headers: _buildHeaders(accessToken: token),
      body: jsonEncode({"name": name, "number": number}),
    );

    if (response.statusCode == 201) {
      ContactModel contact = ContactModel.fromJson(jsonDecode(response.body));
      return contact;
    }

    throw Exception('Failed to create contact');
  }

  @override
  Future<ContactModel> deleteContact({required String id}) async {
    Uri fullUrl = Uri.parse('$url/$id');
    var token = await _getToken();
    var response = await http.delete(
      fullUrl,
      headers: _buildHeaders(accessToken: token),
    );
    if (response.statusCode == 200) {
      ContactModel contact = ContactModel.fromJson(jsonDecode(response.body));
      return contact;
    }
    throw Exception('Failed to delete contact');
  }

  @override
  Future<List<ContactModel>> getContacts() async {
    print('start getContacts');
    var token = await _getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: _buildHeaders(accessToken: token),
    );
    if (response.statusCode == 200) {
      var contactObjsJson = jsonDecode(response.body) as List;
      List<ContactModel> contacts =
          contactObjsJson.map((el) => ContactModel.fromJson(el)).toList();
      return contacts;
    }
    throw Exception('Failed to get contacts');
  }

  @override
  Future<void> updateContact({required String id}) async {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}

// export const fetchContacts = createAsyncThunk(
//   'contacts/fetchAll',
//   async (_, thunkAPI) => {
//     try {
//       const response = await API.get('/contacts');
//       return response.data;
//     } catch (error) {
//       return thunkAPI.rejectWithValue(error.message);
//     }
//   }
// );

// export const addContacts = createAsyncThunk(
//   'contacts/addContact',
//   async (contact, thunkAPI) => {
//     try {
//       const response = await API.post('/contacts', contact);
//       return response.data;
//     } catch (e) {
//       return thunkAPI.rejectWithValue(e.message);
//     }
//   }
// );

// export const deleteContacts = createAsyncThunk(
//   'contacts/deleteContact',
//   async (contactId, thunkAPI) => {
//     try {
//       const response = await API.delete(`/contacts/${contactId}`);
//       return response.data;
//     } catch (e) {
//       return thunkAPI.rejectWithValue(e.message);
//     }
//   }
// );