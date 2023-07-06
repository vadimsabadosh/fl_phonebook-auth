import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/contact_model.dart';

class Contact extends StatelessWidget {
  final ContactModel contact;
  final bool isLoading = false;
  const Contact({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var contactsProvider = context.watch<ContactsProvider>();

    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Text('${contact.name} : ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text(contact.number!, style: TextStyle(fontSize: 16)),
        ]),
        OutlinedButton(
            onPressed: () async {
              try {
                // await contactsProvider.deleteContact(id: contact.id!);
              } catch (e) {
                showAlert(
                    title: 'Error while adding contact',
                    text: e.toString(),
                    context: context);
              }
            },
            child: isLoading ? CircularProgressIndicator() : Text('Delete'))
      ]),
    );
  }

  showAlert({required String title, required String text, context}) {
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
