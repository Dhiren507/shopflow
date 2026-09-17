import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<String?> pickImageFromGallery() async {
  try {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    return pickedFile?.path;
  } catch (e) {
    return null;
  }
}