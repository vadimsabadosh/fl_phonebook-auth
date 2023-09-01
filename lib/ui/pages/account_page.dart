import 'package:flutter/material.dart';
import 'package:phonebook_auth/ui/widgets/alert.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController bioTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  signOut() {
    try {
      // authProvider.logout();
    } catch (e) {
      showAlert(text: e.toString(), title: 'Logout Erorr', context: context);
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
                  Text('Welcome back user?.name!',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text("user?.email"),
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
                      ]),
                    ),
                  )
                ],
              )),
        ));
  }
}
