import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:notty/components/descriptionTextContainer.dart';
import 'package:notty/constants.dart';
import 'package:notty/models/note_model.dart';

import '../components/imageContainer.dart';
import '../constants.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  TextEditingController _noteTextController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  Emoji? _emoji;
  String? _dateNow;
  File? imageFile;
  bool _isNetworkImage = false;
  List<Note>? notes = [];

  void showAlert({required String title, required String alert}) {
    Get.snackbar(title, alert);
  }

  void _pickEmoji() {
    Get.bottomSheet(
      EmojiPicker(
        onEmojiSelected: (category, emoji) {
          print(emoji);
          setState(() {
            _emoji = emoji;
          });
        },
        config: Config(
            columns: 7,
            emojiSizeMax: 32.0,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            progressIndicatorColor: Colors.blue,
            showRecentsTab: true,
            recentsLimit: 28,
            noRecentsText: "No Recents",
            noRecentsStyle:
                const TextStyle(fontSize: 20, color: Colors.black26),
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL),
      ),
    );
  }

  void _pickImage() {
    Get.bottomSheet(
      Container(
        color: kPrimaryColor,
        child: Wrap(
          children: [
            ListTile(
              title: Text("From Gallery"),
              onTap: getImageGallery,
            ),
            ListTile(
              title: Text("From Camera"),
              onTap: getImageCamera,
            ),
            ListTile(
              title: Text("Paste Link"),
              onTap: getImageGallery,
            ),
          ],
        ),
      ),
    );
  }

  // Picking Images
  Future getImageGallery() async {
    _isNetworkImage = false;
    PickedFile pickedFile =
        (await ImagePicker().getImage(source: ImageSource.gallery))!;
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future getImageCamera() async {
    _isNetworkImage = false;
    PickedFile pickedFile =
        (await ImagePicker().getImage(source: ImageSource.camera))!;
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  //FIXME off-looking syntax
  getImageFromLink({String? imageLink}) {
    _isNetworkImage = true;
    if (imageLink == null) {
      return;
    } else {
      return imageLink;
    }
  }

  Future<bool> _onWillPopScope() async {
    bool? exit;
    await Get.defaultDialog(
        title: "Exiting?",
        middleText:
            "Are you sure you want to exit? If you close this page now you'll lose all your current progress${notes != null && notes!.length > 0 ? " which includes ${notes!.length} ${notes!.length == 1 ? "thing" : "things"} you're grateful for" : "."}",
        textConfirm: "Exit",
        textCancel: "Stay",
        onConfirm: () {
          exit = true;
          Navigator.pop(context);
        },
        onCancel: () {
          exit = false;
        });

    print("Returning exit as $exit");
    return exit!;
  }

  void addNote() {
    var note = _noteTextController.value.text;
    if (note.isNotEmpty) {
      Note newNote = new Note(content: note);
      setState(() {
        notes!.add(newNote);
        _noteTextController.clear();
        print("$note length = ${notes!.length}");
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 70.0,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      showAlert(
          title: "Hey there!",
          alert: "What's that thing you are feeling grateful for?");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = new DateTime.now();
    String date = DateFormat('MM-yyyy').format(now);
    String time = DateFormat('hh:mm').format(now);
    String day = DateFormat('EEEE').format(now);

    setState(() {
      _dateNow = "$day $date";
    });
    print("$day $date at $time");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPopScope();
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          onLongPress: () {
            if (notes!.length > 0) {
              Get.defaultDialog(
                  title: "Done with the entry",
                  middleText:
                      "Would you like to save this in your gratitude journal?");
            } else {
              showAlert(
                  title: "No entries",
                  alert: "Enter things you are feeling grateful for");
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(_dateNow == null ? "New Note" : _dateNow!),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: _emoji == null
                        ? Container()
                        : Text(
                            _emoji!.emoji,
                            style: TextStyle(fontSize: 32.0),
                          ),
                    onTap: _pickEmoji,
                  ),
                )
              ],
            ),
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Add a cover
                // Save the Date and Time
                // Pick an Emoji to show how you're feeling
                // Write what you are grateful for. Have list of notes
                SliverToBoxAdapter(
                  child: imageFile == null
                      ? Container()
                      : ImageContainer(
                          borderRadius: kBorderRadius,
                          imageSource: imageFile!,
                          height: 120.0,
                          elevation: kElevation,
                          isNetworkImage: _isNetworkImage,
                        ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: kWidgetPadding * 1.5),
                        child: DescriptionTextContainer(
                            padding: kWidgetPadding * 2,
                            borderRadius: kBorderRadius,
                            elevation: 2,
                            text: notes![index].content,
                            isTitle: false),
                      );
                    },
                    childCount: notes == null ? 0 : notes!.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kWidgetPadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: _pickEmoji,
                            child: Icon(
                              Icons.emoji_emotions_rounded,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Icon(
                              Icons.image_rounded,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 18,
                          child: TextField(
                            controller: _noteTextController,
                            decoration: InputDecoration(
                                labelText: 'What are you grateful for?',
                                labelStyle: TextStyle(color: Colors.white),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: addNote,
                            child: Icon(
                              Icons.send,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  final double height;
  final double? width;
  final bool isNetworkImage;
  final imageSource;
  final double borderRadius;
  const CoverImage({
    Key? key,
    required this.height,
    this.width,
    required this.isNetworkImage,
    required this.imageSource,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width == null ? double.infinity : width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(imageSource)
                : AssetImage(imageSource) as ImageProvider,
            // Refer: https://github.com/flutter/flutter/issues/77782
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
