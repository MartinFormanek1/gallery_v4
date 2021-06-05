import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(getTitle()),
        ),
      ),
    );
  }

  String getTitle() {
    return "wrapper";
  }
}
