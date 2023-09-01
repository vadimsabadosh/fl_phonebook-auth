import 'package:flutter/material.dart';
import '../../models/contact_model.dart';
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
    // context.read<ContactsProvider>().getContacts();
    _filterController = TextEditingController();
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void addContact(ContactModel contact) async {
    // final ContactsProvider contactsProvider = context.watch<ContactsProvider>();
    try {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Dialog(
              backgroundColor: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularProgressIndicator(),
                  ]),
            );
          });
      // await contactsProvider.createContact(
      //     name: contact.name!, number: contact.number!);
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      showAlert(title: 'Error while adding contact', text: e.toString());
    }
  }

  List<ContactModel> getContacts() {
    String filter = _filterController.text.toLowerCase();
    return _contacts
        .where((element) => element.number!.toLowerCase().contains(filter))
        .toList();
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add new contact',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ContactForm(addContact: addContact),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Phonebook'),
          backgroundColor: Colors.black54,
          actions: [
            IconButton(
              onPressed: showForm,
              icon: const Icon(
                Icons.person_add_outlined,
                size: 30,
              ),
            )
          ]),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
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

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }
}
