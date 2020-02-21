import 'dart:io';

import 'package:dabba_app/constants/route_names.dart';
import 'package:dabba_app/locator.dart';
import 'package:dabba_app/models/cloud_storage_result.dart';
import 'package:dabba_app/models/user.dart';
import 'package:dabba_app/service/authentication_service.dart';
import 'package:dabba_app/service/cloud_storage_service.dart';
import 'package:dabba_app/service/firestore_service.dart';
import 'package:dabba_app/service/navigation_service.dart';
import 'package:dabba_app/utils/image_selector.dart';
import 'package:dabba_app/viewmodels/base_model.dart';

class AccountViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  File _selectedImage;

  File get selectedImage => _selectedImage;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImageFromGallery();
    if (tempImage != null) {
      _selectedImage = tempImage;
      notifyListeners();

      CloudStorageResult cloudStorageResult =
          await _cloudStorageService.uploadImage(imageToUpload: _selectedImage);

      User updateUser = User(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          id: user.id,
          gender: user.gender,
          userRole: user.userRole,
          profileImage: cloudStorageResult.imageUrl);

      var result = _firestoreService.updateUser(updateUser);

      if (result is String) {
        print("failed");
      } else {
        setUser(updateUser);
        notifyListeners();
      }
    }
  }

  void logoutUser() async {
    await _authenticationService.logOut();
    await _navigationService.navigateToReplace(LoginViewRoute);
  }
}
