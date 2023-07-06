import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late String? email;
  late String? username;
  TextEditingController bioTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  savePreferences() {
    // final AuthProvider authProvider = context.read<AuthProvider>();
    // appwrite.updatePreferences(bio: bioTextController.text);
    const snackbar = SnackBar(content: Text('Preferences updated!'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  signOut() {
    try {
      // authProvider.logout();
    } catch (e) {
      showAlert(text: e.toString(), title: 'Logout Erorr');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Account'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                signOut();
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome back $username!',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text('$email'),
                  const SizedBox(height: 40),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        TextField(
                          controller: bioTextController,
                          decoration: const InputDecoration(
                            labelText: 'Your Bio',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () => savePreferences(),
                          child: const Text('Save Preferences'),
                        ),
                      ]),
                    ),
                  )
                ],
              )),
        ));
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