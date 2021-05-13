import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notty/components/noteWidget.dart';
import 'package:notty/constants.dart';
import 'package:notty/screens/new_note.dart';

import 'new_note.dart';

class Home extends StatefulWidget {
  static String id = "myNotes";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notty"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPagePadding / 2),
          child: Column(
            children: [
              //Widget to store the notes in
              NoteWidget(
                heroTag: "hero",
                textTitle: "Title",
                textContent: kLoremLong,
                imageUrl: kSampleImage,
                isNetworkImage: true,
              ),
              NoteWidget(
                heroTag: "hero2",
                textTitle: "Title",
                textContent: kLoremLong,
                imageUrl: kSampleImage2,
                isNetworkImage: true,
              ),
              NoteWidget(
                heroTag: "hero3",
                textTitle: "Title",
                textContent: kLoremLong,
                imageUrl: kSampleImage3,
                isNetworkImage: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: kAccentColor,
        onPressed: () {
          Get.to(() => NewNote());
        },
        tooltip: 'New note',
        child: Icon(
          Icons.note_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
