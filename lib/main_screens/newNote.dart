import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  static String id = "newNote";
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Note"),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
