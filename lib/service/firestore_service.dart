import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dabba_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _userCollectionReference =
      Firestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _userCollectionReference
          .document(user.email)
          .setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future updateUser(User user) async {
    try{
      await _userCollectionReference.document(user.email).updateData(user.toJson());
    } on PlatformException catch (e){
      return e.message;
    }
  }

  Future<User> getUser(FirebaseUser firebaseUser) async {
    try {
      var userData =
          await _userCollectionReference.document(firebaseUser.email).get();
      User user = User.fromData(userData.data);
      if (firebaseUser.uid == user.id) {
        return user;
      }
    } catch (e) {
      return e.message;
    }
  }
}
