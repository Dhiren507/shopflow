import 'package:flutter/material.dart';
import 'package:shopflow/core/utils/image_picker_helper.dart';

class ProfileScreenProvider extends ChangeNotifier {
  String? avatarImage = '';

  void setAvatarImage(String? imagePath) {
    avatarImage = imagePath;
    notifyListeners();
  }

  Future<void> pickAvatarImage() async {
    final String? selectedImagePath = await pickImageFromGallery();

    if (selectedImagePath != null) {
      avatarImage = selectedImagePath;
      notifyListeners();
    }
  }
}
