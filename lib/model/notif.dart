class Notif {
  final int id;
  final String from;
  final String subject;
  final DateTime dateTime;
  final String body;
  final String image;
  bool read;

  Notif({
    required this.id,
    required this.from,
    required this.subject,
    required this.dateTime,
    required this.body,
    required this.image,
    this.read = false,
  });
}
