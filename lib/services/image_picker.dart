import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker_for_web/image_picker_for_web.dart'
    show ImagePickerPlugin;

Future<XFile?> imagePicker() async {
  XFile? currentImage;

  if (kIsWeb) {
    final imagePicker = ImagePickerPlugin();
    currentImage = await imagePicker.getImageFromSource(
      source: ImageSource.camera,
    );
  } else {
    final ImagePicker imagePicker = ImagePicker();
    currentImage = await imagePicker.pickImage(source: ImageSource.gallery);
  }
  return currentImage;
}
