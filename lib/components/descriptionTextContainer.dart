import 'package:flutter/material.dart';
import 'package:notty/constants.dart';

class DescriptionTextContainer extends StatelessWidget {
  final double borderRadius;
  final double elevation;
  final double width;
  final String text;
  final bool isTitle;

  DescriptionTextContainer(
      {@required this.borderRadius,
      @required this.elevation,
      this.width,
      @required this.text,
      @required this.isTitle});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: elevation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: kPrimaryColor,
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(kWidgetPadding * 4),
                child: isTitle
                    ? Center(
                        child: Text(
                          text,
                          style: kPrimaryTextStyle.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      )
                    : Text(
                        text,
                        style: kPrimaryTextStyle.copyWith(height: 1.2),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
