import 'package:flutter/material.dart';
import 'package:notty/components/imageContainer.dart';
import 'package:notty/constants.dart';
import 'package:notty/components/activityPanel.dart';
import 'package:notty/components/activityClasses.dart';
import 'package:notty/components/descriptionTextContainer.dart';

class NoteDetails extends StatefulWidget {
  static String id = "noteDetails";
  final String heroTag;
  final String imageUrl;
  final String title;
  final String text;

  NoteDetails({@required this.heroTag, this.imageUrl, this.title, this.text});
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  Activity addNote =
      Activity(Icons.add, kSecondaryColor, 30.0, "Add new note", () {
    print("Adding new activity");
  });

  Activity goBack =
      Activity(Icons.close, kSecondaryColor, 30.0, "Open previous page", () {
    print("Exiting");
  });

  //TODO check of this is favorite or not and toggle
  Activity toggleFavorite = Activity(
      Icons.favorite_border, kSecondaryColor, 30.0, "Add to your favorites",
      () {
    print("Toggle favorite status");
  });

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
                  imageUrl: widget.imageUrl,
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
                  goBack: goBack,
                  toggleFavorite: toggleFavorite,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kWidgetPadding + 4.0),
                child: DescriptionTextContainer(
                  text: widget.text,
                  borderRadius: kBorderRadius * 4,
                  elevation: kElevation,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
