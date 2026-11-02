import 'package:image_picker/image_picker.dart';

class ProfileImagePicker {
  final ImagePicker _picker =ImagePicker();
 Future<XFile?> pickImage()async{
    final XFile? image =await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80,maxWidth: 1000);
    return image;
  }
}