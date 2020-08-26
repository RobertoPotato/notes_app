import 'package:flutter/material.dart';
import 'package:notty/constants.dart';
import 'package:notty/components/activityClasses.dart';

class ActivityPanel extends StatelessWidget {
  final double borderRadius;
  final double elevation;
  final double height;
  final double width;
  final double iconSize;
  final IconData icon;
  final Color iconColor;
  final Activity addItem;
  final Activity goBack;
  final Activity toggleFavorite;

  ActivityPanel(
      {@required this.borderRadius,
      @required this.elevation,
      @required this.height,
      this.width,
      @required this.iconSize,
      @required this.icon,
      @required this.iconColor,
      @required this.addItem,
      @required this.goBack,
      @required this.toggleFavorite});

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: InkWell(
                  onTap: toggleFavorite.onTap,
                  child: Tooltip(
                    preferBelow: false,
                    message: toggleFavorite.hint,
                    child: Icon(
                      toggleFavorite.icon,
                      size: toggleFavorite.iconSize,
                      color: toggleFavorite.iconColor,
                    ),
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Tooltip(
                    preferBelow: false,
                    message: goBack.hint,
                    child: Icon(
                      goBack.icon,
                      size: goBack.iconSize,
                      color: goBack.iconColor,
                    ),
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: addItem.onTap,
                  child: Tooltip(
                    preferBelow: false,
                    message: addItem.hint,
                    child: Icon(
                      addItem.icon,
                      size: addItem.iconSize,
                      color: addItem.iconColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
