import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'note_model.dart';

class JournalEntry {
  bool isFavorite;
  DateTime dateTime;
  Emoji feelingEmoji;
  String? coverImage;
  List<Note> notes;

  JournalEntry(this.isFavorite, this.dateTime, this.feelingEmoji, this.notes);
}
