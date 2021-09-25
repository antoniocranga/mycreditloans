import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerManager
{
  static Future<File> getImageFrom(ImageSource source) async 
  {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        return imageFile;
    }
    return Future.error("Image null");
  }
}