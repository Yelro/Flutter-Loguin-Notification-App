import 'package:flutter/material.dart';
import 'screens/notif_list_screen.dart';
import 'screens/notif_login_screen.dart';
import 'screens/notif_register_screen.dart';

void main() {
  runApp(const RoutesApp());
}

class RoutesApp extends StatelessWidget{
  const RoutesApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: NotifLoginScreen(),
      initialRoute: NotifLoginScreen.id,
      routes: {
        NotifRegisterScreen.id:(context) => const NotifRegisterScreen(),
        NotifLoginScreen.id:(context) => const NotifLoginScreen(),
        NotifListScreen.id:(context) => const NotifListScreen(title: 'Notifications'),
      },
    );
  }
}
