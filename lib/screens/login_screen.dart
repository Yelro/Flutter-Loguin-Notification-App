import 'package:flutter/material.dart';

import '../constants.dart';
import 'info_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // State.
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                username = value;
              },
              decoration:
                  textFieldDecoration.copyWith(hintText: 'Enter your username'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  textFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 64.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen(username: username, password: password);
                }));
              },
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
