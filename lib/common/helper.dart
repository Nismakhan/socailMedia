import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Helper {
  static Future<String> uploadImage(
      {required String id, required XFile file, required String ref}) async {
    try {
      final _storage = FirebaseStorage.instance;
      TaskSnapshot taskSnapshot =
          await _storage.ref(ref).putFile(File(file.path));
      final url = await taskSnapshot.ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteImage({required String url}) async {
    final _storage = FirebaseStorage.instance;
    final ref = _storage.refFromURL(url);
    await _storage.ref(ref.fullPath).delete();
  }
}
