import 'package:flutter/material.dart';

import '../constants.dart';

class InfoScreen extends StatelessWidget {
  static const String id = 'info_screen';

  final String username;
  final String password;

  const InfoScreen({Key? key, required this.username, required this.password})
      : super(key: key);

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
            const Text(
              'You have entered this username:',
              textAlign: TextAlign.center,
            ),
            Text(
              username,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'You have entered this password:',
              textAlign: TextAlign.center,
            ),
            Text(
              password,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 64.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Go back',
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
