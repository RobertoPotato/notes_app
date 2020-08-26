import 'package:flutter/material.dart';
import 'package:notty/main_screens/newNote.dart';
import 'package:notty/constants.dart';
import 'package:notty/components/noteWidget.dart';

class MyNotes extends StatefulWidget {
  static String id = "myNotes";

  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  void _addNotePage() {
    Navigator.pushNamed(context, NewNote.id);
  }

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
                height: 100.0,
                textWidth: 240.0,
                borderRadius: kBorderRadius * 2,
                textElevation: kElevation,
                imageUrl: kSampleImage,
                isNetworkImage: true,
                imageElevation: kElevation,
              ),
              NoteWidget(
                heroTag: "hero2",
                textTitle: "Title",
                textContent: kLoremLong,
                height: 100.0,
                textWidth: 240.0,
                borderRadius: kBorderRadius * 2,
                textElevation: kElevation,
                imageUrl: kSampleImage2,
                isNetworkImage: true,
                imageElevation: kElevation,
              ),
              NoteWidget(
                heroTag: "hero3",
                textTitle: "Title",
                textContent: kLoremLong,
                height: 100.0,
                textWidth: 240.0,
                borderRadius: kBorderRadius * 2,
                textElevation: kElevation,
                imageUrl: kSampleImage3,
                isNetworkImage: true,
                imageElevation: kElevation,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: kAccentColor,
        onPressed: _addNotePage,
        tooltip: 'New note',
        child: Icon(Icons.note_add, color: Colors.white,),
      ),
    );
  }
}
