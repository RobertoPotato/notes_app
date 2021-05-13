import 'package:flutter/material.dart';
import 'package:notty/components/imageContainer.dart';
import 'package:notty/components/textContainer.dart';
import 'package:notty/screens/note_details.dart';

import '../constants.dart';

// TODO Dismissible swipe to EDIT or DELETE
class NoteWidget extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final String imageUrl;
  final bool isNetworkImage;
  final String heroTag;

  NoteWidget({
    required this.textTitle,
    required this.textContent,
    required this.imageUrl,
    required this.isNetworkImage,
    required this.heroTag,
  });
  @override
  Widget build(BuildContext context) {
    const HEIGHT = 100.0;
    const ELEVATION = 4.0;
    const BORDER_RADIUS = 32.0;
    return Padding(
      padding: const EdgeInsets.only(
        top: kWidgetPadding,
        left: kWidgetPadding,
        right: kWidgetPadding,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => NoteDetails(
                heroTag: heroTag,
                imageUrl: imageUrl,
                title: textTitle,
                notes: [],
                date: '',
              ),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Hero(
                tag: heroTag,
                child: ImageContainer(
                  imageSource: imageUrl,
                  borderRadius: BORDER_RADIUS,
                  isNetworkImage: isNetworkImage,
                  elevation: ELEVATION,
                  height: HEIGHT,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: TextContainer(
                title: textTitle,
                text: textContent,
                borderRadius: BORDER_RADIUS,
                elevation: ELEVATION,
                height: HEIGHT,
              ),
            )
          ],
        ),
      ),
    );
  }
}
