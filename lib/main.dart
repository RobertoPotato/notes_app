import 'package:flutter/material.dart';
import 'main_screens/allMyNotes.dart';
import 'main_screens/newNote.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        scaffoldBackgroundColor: kPrimaryColor.withOpacity(0.7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      initialRoute: MyNotes.id,
      routes: {
        MyNotes.id: (context) => MyNotes(),
        NewNote.id: (context) => NewNote(),
        //NoteDetails.id: (context) => NoteDetails(),
      },
    );
  }
}
