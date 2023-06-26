import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact_model.dart';
import '../providers/contacts_provider.dart';

class Contact extends StatelessWidget {
  final ContactModel contact;
  const Contact({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deleteContact = context.read<ContactsProvider>().deleteContact;

    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Text('${contact.name} : ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text(contact.number!, style: TextStyle(fontSize: 16)),
        ]),
        OutlinedButton(
            onPressed: () {
              deleteContact(id: contact.id!);
            },
            child: Text('Delete'))
      ]),
    );
  }
}
