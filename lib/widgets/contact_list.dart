// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../providers/contacts_provider.dart';
import 'contact.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ContactModel> contacts = context.read<ContactsProvider>().contacts;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Contact(contact: contacts[index]);
        },
        itemCount: contacts.length,
      ),
    );
  }
}
