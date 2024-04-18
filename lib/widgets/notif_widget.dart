import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/notif.dart';

class NotifWidget extends StatelessWidget {
  final Notif notif;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const NotifWidget(
      {Key? key,
      required this.notif,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(notif.id);
      },
      onLongPress: () {
        onLongPress(notif.id);
      },
      onTap: () {
        onTap(notif);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: notif.read ? Colors.transparent : primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(notif.dateTime.toString().substring(0, 10),
                      style: dateTextStyle),
                  Text(notif.from, style: fromTextStyle),
                  Text(notif.subject, style: subjectTextStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
