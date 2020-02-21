import 'dart:io';

import 'package:dabba_app/models/cloud_storage_result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage(
      {@required File imageToUpload}) async {
    var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return CloudStorageResult(imageUrl: url, imageFileName: imageFileName);
    }

    return null;
  }
}
