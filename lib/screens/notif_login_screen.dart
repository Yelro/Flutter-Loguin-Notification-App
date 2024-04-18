import 'package:flutter/material.dart';
import '../constants.dart';
import 'notif_list_screen.dart';
import 'notif_register_screen.dart';

class NotifLoginScreen extends StatefulWidget {
  static const String id = 'notf_login_screen';

  const NotifLoginScreen({Key? key,}) : super(key: key);

  @override
  _NotifLoginScreenState createState() => _NotifLoginScreenState();
}

class _NotifLoginScreenState extends State<NotifLoginScreen> {
  // State.
  late String useremail;
  late String password;

  // Expresiones regulares para validar email y contraseña
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  // Función para validar email
  bool validateEmail(String email) {
    return emailRegExp.hasMatch(email);
  }

  // Función para validar contraseña
  bool validatePassword(String password) {
    return passwordRegExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 223, 245),
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
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Color.fromARGB(179, 164, 12, 12),
              ),
              onChanged: (value) {
                setState(() {
                  useremail = value;
                });
              },
              decoration: textFieldDecoration.copyWith(hintText: 'Email: example@gmail.com', prefixIcon: const Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                color: Color.fromARGB(179, 164, 12, 12),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: textFieldDecoration.copyWith(hintText: 'Password: Example2@._ ', prefixIcon: const Icon(Icons.password)),
            ),
            const SizedBox(
              height: 64.0,
            ),
            TextButton(
              onPressed: () {
                if (validateEmail(useremail) && validatePassword(password)) {

                  Navigator.pushNamed(context, NotifListScreen.id);

                } else {
                  // Mostrar mensaje de error si la validación falla
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Please enter a valid email and password with at least 6 characters, containing uppercase, lowercase, numbers, and special characters."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, NotifRegisterScreen.id);
              },
              child: const Text('You can register here'),
            ),
          ],
        ),
      ),
    );
  }
}
