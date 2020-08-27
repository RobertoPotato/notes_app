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
  final Activity info;

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
      @required this.toggleFavorite,
      @required this.info});

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
              //Panel Help
              Container(
                child: InkWell(
                  onTap: info.onTap,
                  child: Tooltip(
                    preferBelow: false,
                    message: info.hint,
                    child: Icon(
                      info.icon,
                      size: info.iconSize,
                      color: info.iconColor,
                    ),
                  ),
                ),
              ),
              //Favorite toggle
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
              //Close Page
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
              //Add a new item to note
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
