import 'package:flutter/material.dart';
import 'package:notty/components/imageContainer.dart';
import 'package:notty/components/textContainer.dart';
import 'package:notty/constants.dart';
import 'package:notty/main_screens/noteDetails.dart';

class NoteWidget extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final double height;
  final double textWidth;
  final double borderRadius;
  final double textElevation;
  final String imageUrl;
  final bool isNetworkImage;
  final double imageElevation;
  final String heroTag;

  NoteWidget(
      {@required this.textTitle,
      @required this.textContent,
      @required this.height,
      @required this.textWidth,
      @required this.borderRadius,
      @required this.textElevation,
      @required this.imageUrl,
      @required this.isNetworkImage,
      @required this.imageElevation,
      @required this.heroTag});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => NoteDetails(
              heroTag: heroTag,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kWidgetPadding,
                  top: kWidgetPadding,
                  bottom: kWidgetPadding),
              child: Hero(
                tag: heroTag,
                child: ImageContainer(
                  imageUrl: imageUrl,
                  borderRadius: borderRadius,
                  isNetworkImage: isNetworkImage,
                  elevation: imageElevation,
                  height: height,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: TextContainer(
              title: textTitle,
              text: textContent,
              height: height,
              width: textWidth,
              borderRadius: borderRadius,
              elevation: textElevation,
            ),
          )
        ],
      ),
    );
  }
}
