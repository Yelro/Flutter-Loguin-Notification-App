import 'package:flutter/material.dart';
import 'notif_login_screen.dart';
import '../constants.dart';


class NotifRegisterScreen extends StatefulWidget {
  static const String id = 'notif_register_screen';

  const NotifRegisterScreen({Key? key}) : super(key: key);

  @override
  _NotifRegisterScreenState createState() => _NotifRegisterScreenState();
}

class _NotifRegisterScreenState extends State<NotifRegisterScreen> {
  // State.
  late String username;
  late String useremail;
  late String password;

  // Expresiones regulares para validar email y contraseña
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
  RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$'); // Expresión regular para validar solo texto en el nombre

  
  // Función para validar nombre
  bool validateName(String name) {
    return nameRegExp.hasMatch(name);
  }
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
              keyboardType: TextInputType.name,
              style: const TextStyle(
                color: Color.fromARGB(179, 164, 12, 12),
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: textFieldDecoration.copyWith(hintText: 'Name', prefixIcon: const Icon(Icons.person_outline)),
            ),
            const SizedBox(
              height: 16.0,
            ),
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
                if (validateName(username) && validateEmail(useremail) && validatePassword(password)) {
                  Navigator.pushNamed(context, NotifLoginScreen.id);

                } else {
                  // Mostrar mensaje de error si la validación falla
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Please enter a valid name, email, and password with at least 6 characters, containing uppercase, lowercase, numbers, and special characters."),
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
                'Register me',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
