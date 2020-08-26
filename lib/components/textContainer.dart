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
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: elevation,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kWidgetPadding, horizontal: kWidgetPadding + 4),
          child: Row(
            children: [
              Container(
                height: 100.0,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kHeaderTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: Text(
                        text,
                        style: kPrimaryTextStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
