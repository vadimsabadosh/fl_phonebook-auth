import 'package:flutter/material.dart';

class PhonebookPage extends StatefulWidget {
  const PhonebookPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<PhonebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phonebook App'),
      ),
      body: Center(child: Text('Welcome to Phonebook')),
    );
  }
}
