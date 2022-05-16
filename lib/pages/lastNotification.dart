import 'package:flutter/material.dart';

class LastNotification extends StatefulWidget {
  const LastNotification({Key? key}) : super(key: key);

  @override
  State<LastNotification> createState() => _LastNotificationState();
}

class _LastNotificationState extends State<LastNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geçmiş Bildiriler DetailPage"),
      ),
      backgroundColor: Colors.white,
    );
  }
}