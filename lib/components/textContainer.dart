import 'package:flutter/material.dart';
import 'package:notty/constants.dart';

class TextContainer extends StatelessWidget {
  final double borderRadius;
  final double elevation;
  final double height;
  final double width;
  final String title;
  final String text;

  TextContainer(
      {@required this.borderRadius,
      @required this.elevation,
      @required this.height,
      this.width,
      @required this.title,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: kPrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kWidgetPadding * 2, horizontal: kWidgetPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: kHeaderTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                //TODO turn this to an emoji
                Icon(
                  Icons.face_rounded,
                ),
              ],
            ),
            Flexible(
              child: Text(
                text,
                style: kPrimaryTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
