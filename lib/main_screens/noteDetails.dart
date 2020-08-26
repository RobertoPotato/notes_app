import 'package:flutter/material.dart';
import 'package:notty/components/imageContainer.dart';
import 'package:notty/constants.dart';

class NoteDetails extends StatefulWidget {
  static String id = "noteDetails";
  final String heroTag;
  final String imageUrl;

  NoteDetails({@required this.heroTag, this.imageUrl});
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: widget.heroTag,
          child: ImageContainer(
            borderRadius: kBorderRadius,
            bottomLeftRad: kBorderRadius * 4,
            bottomRightRad: kBorderRadius * 4,
            elevation: kElevation,
            imageUrl: widget.imageUrl,
            isNetworkImage: true,
            height: 400.0,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
