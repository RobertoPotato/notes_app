import 'package:flutter/material.dart';
import 'package:notty/components/activityPanel.dart';
import 'package:notty/components/descriptionTextContainer.dart';
import 'package:notty/components/imageContainer.dart';
import 'package:notty/constants.dart';
import 'package:notty/models/activity_model.dart';
import 'package:notty/models/note_model.dart';

class NoteDetails extends StatefulWidget {
  static String id = "noteDetails";
  final String heroTag;
  final String imageUrl;
  final String title;
  final String date;
  final List<Note> notes;

  NoteDetails({
    required this.heroTag,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.notes,
  });
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: widget.heroTag,
                child: ImageContainer(
                  borderRadius: kBorderRadius,
                  bottomLeftRad: kBorderRadius * 4,
                  bottomRightRad: kBorderRadius * 4,
                  elevation: kElevation,
                  imageSource: widget.imageUrl,
                  isNetworkImage: true,
                  height: 450.0,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kWidgetPadding + 4.0),
                child: ActivityPanel(
                  iconColor: kSecondaryColor,
                  elevation: kElevation,
                  height: 60.0,
                  icon: Icons.favorite,
                  iconSize: 30.0,
                  borderRadius: kBorderRadius * 4,
                  addItem: addNote,
                  toggleFavorite: toggleFavorite,
                  share: share,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kWidgetPadding + 4.0),
                child: DescriptionTextContainer(
                  padding: kWidgetPadding * 3,
                  text: widget.title,
                  borderRadius: kBorderRadius * 4,
                  elevation: kElevation,
                  isTitle: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: kWidgetPadding + 4.0),
                child: DescriptionTextContainer(
                  padding: kWidgetPadding * 3,
                  text: widget.title,
                  borderRadius: kBorderRadius * 4,
                  elevation: kElevation,
                  isTitle: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
