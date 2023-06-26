import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_list.dart';

class PhonebookPage extends StatefulWidget {
  const PhonebookPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<PhonebookPage> {
  late TextEditingController _filterController;
  List<ContactModel> _contacts = [];

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController();
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void addContact(ContactModel contact) async {
    setState(() {
      _contacts.add(contact);
    });
  }

  void deleteContact(String id) {
    setState(() {
      _contacts = _contacts.where((contact) => contact.id != id).toList();
    });
  }

  List<ContactModel> getContacts() {
    String filter = _filterController.text.toLowerCase();
    return _contacts
        .where((element) => element.number!.toLowerCase().contains(filter))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Phonebook'),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ContactForm(addContact: addContact),
            const SizedBox(height: 20),
            const Text(
              'Contacts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Find contact by name',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _filterController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search by name',
              ),
            ),
            const SizedBox(height: 20),
            ContactList(),
          ],
        ),
      ),
    );
  }
}
