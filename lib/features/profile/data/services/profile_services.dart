import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadProfileImage(XFile image, String userId) async {
    final imageBytes = await image.readAsBytes();
    final storageRef = _storage
        .ref()
        .child('profile_images')
        .child('$userId.jpg');
    await storageRef.putData(
      imageBytes,
      SettableMetadata(contentType: 'image/jpeg'),
    );

    return await storageRef.getDownloadURL();
  }
}
