import 'package:flutter/material.dart';
import '../model/notif_backend.dart';
import '../model/notif.dart';
import '../widgets/notif_widget.dart';
import 'notif_detail_screen.dart';

class NotifListScreen extends StatefulWidget {

  static const String id = 'notf_list_screen';

  const NotifListScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _NotifListScreenState createState() => _NotifListScreenState();
}

class _NotifListScreenState extends State<NotifListScreen> {
  // State.
  var notifs = NotifBackend().getNotifs();

  void markNotifAsRead(int id) {
    NotifBackend().markNotifAsRead(id);
    setState(() {
      notifs = NotifBackend().getNotifs();
    });
  }

  void deleteNotif(int id) {
    NotifBackend().deleteNotif(id);
    setState(() {
      notifs = NotifBackend().getNotifs();
    });
  }

  void showDetail(Notif notif) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NotifDetailScreen(notif: notif);
    }));

    NotifBackend().markNotifAsRead(notif.id);
    setState(() {
      notifs = NotifBackend().getNotifs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color.fromARGB(255, 192, 223, 245),
      body: ListView.separated(
        itemCount: notifs.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.blueGrey,
          indent: 40.0,
          endIndent: 20.0,
        ),
        itemBuilder: (BuildContext context, int index) => NotifWidget(
          notif: notifs[index],
          onTap: showDetail,
          onLongPress: markNotifAsRead,
          onSwipe: deleteNotif,
        ),
      ),
    );
  }
}
