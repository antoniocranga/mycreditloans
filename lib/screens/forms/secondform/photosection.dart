import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycreditloans/constants.dart';
import 'package:mycreditloans/managers/imagepicker.dart';

class PhotoSection extends StatefulWidget {
  final ValueChanged<File?> imageFile;
  PhotoSection({Key? key, required this.imageFile}) : super(key: key);

  @override
  _PhotoSectionState createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSection> {
  String photoLabel = "Poză cu ultima factură";
  File? imagePicked;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: size.width,
      height: size.height * 0.08,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(photoLabel, style: labelTextStyle),
          imagePicked == null
              ? buttonsRowWidget()
              : uploadedPictureWidget(context),
        ],
      ),
    );
  }

//Photo Buttons widgets
  Widget buttonsRowWidget() {
    return Row(
      children: [
        Material(
          type: MaterialType.transparency,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: Icon(
              Icons.attach_file_sharp,
              color: logoColor,
            ),
            onPressed: () {
              uploadPicture(ImageSource.gallery);
            },
          ),
        ), // Upload picture button from gallery
        Material(
          type: MaterialType.transparency,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: logoColor,
            ),
            onPressed: () {
              uploadPicture(ImageSource.camera);
            },
          ), // Upload picture button from camera
        ),
      ],
    );
  }

//Photo already uploaded widgets
  Widget uploadedPictureWidget(BuildContext context) {
    return Row(
      children: [
        Material(
          type: MaterialType.transparency,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: Icon(
              Icons.visibility_rounded,
              color: logoColor,
            ),
            onPressed: () {
              visualizePicture(context);
            },
          ),
        ), // Visualize picture button
        Material(
          type: MaterialType.transparency,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: redColor,
            ),
            onPressed: () {
              removePicture();
            },
          ),
        ), // Remove picture button
      ],
    );
  }


//Functions
  Future<void> uploadPicture(ImageSource source) async {
    await ImagePickerManager.getImageFrom(source).then((value) {
      imagePicked = value;
      this.widget.imageFile(value);
      print(imagePicked!.path);
      setState(() {
        photoLabel = "Poză adăugată";
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  void removePicture() {
    setState(() {
      photoLabel = "Poză cu ultima factură";
      imagePicked = null;
      widget.imageFile(null);
    });
  }

  void visualizePicture(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Image.file(imagePicked!),
            ));
  }

}
