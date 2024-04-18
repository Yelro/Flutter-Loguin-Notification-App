import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/notif.dart';

class NotifDetailScreen extends StatelessWidget {

   static const String id = 'notf_detail_screen';

  final Notif notif;

  const NotifDetailScreen({Key? key, required this.notif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(notif.subject),
        ),
        backgroundColor: Color.fromARGB(255, 192, 223, 245),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${notif.from}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 10.0),
              Text(notif.subject, style: subjectTextStyle),
              const SizedBox(height: 5.0),
              Text(notif.dateTime.toString().substring(0, 16), style: dateTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 10.0),
              Text(notif.body, style: bodyTextStyle),
              
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 5.0),
              Center(
                child: Image.asset(
                notif.image,
                width: 100, 
                height: 80, 
                ),
              ),
            
            ],
          ),
        ));
  }
}
