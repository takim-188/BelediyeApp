import 'package:flutter/material.dart';

class BildiriPage extends StatefulWidget {
  const BildiriPage({Key? key}) : super(key: key);

  @override
  State<BildiriPage> createState() => _BildiriPageState();
}

class _BildiriPageState extends State<BildiriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildiri Sayfası"),
      ),
      backgroundColor: Colors.white,
    );
  }
}
