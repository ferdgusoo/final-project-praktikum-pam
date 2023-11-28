import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker _picker = ImagePicker();

  void getImageFromGallery(Function(String?) callbacks) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      callbacks (pickedFile?.path);
    }

    catch (e) {
      print("galeri error");
    }
  }

  void getImageFromCamera(Function(String?) callbacks) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      callbacks (pickedFile?.path);
    }

    catch (e) {
      print("kamera error");
    }
  }

}