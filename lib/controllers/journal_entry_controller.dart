import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notty/models/journal_entry_model.dart';
import 'package:notty/models/note_model.dart';

class JournalEntryController extends GetxController {
  List<Note> notes = [];

  void toggleFavoriteStatus(JournalEntry entry) {
    entry.isFavorite = !entry.isFavorite;
    update();
  }

  IconData checkFavoriteStatus({required bool isFav}) {
    if (isFav) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border;
    }
  }
}
