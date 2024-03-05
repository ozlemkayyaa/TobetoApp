import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto/utils/constants/collection.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future uploadPhoto(File photoUrl) async {
    // Kullanıcının bilgilerini al
    User? loggedInUser = _firebaseAuth.currentUser!;

    final reference =
        _firebaseStorage.ref().child('profileImages/${loggedInUser.uid}.png');

    // indirme url'sini firestore'a kaydetmek için al

    await reference.putFile(photoUrl);

    final dowloadUrl = await reference.getDownloadURL();

    // user koleksiyonuna ekle
    await _firebaseFirestore
        .collection(Collections.USERS)
        .doc(loggedInUser.uid)
        .update({'profilePhoto': dowloadUrl, 'userId': loggedInUser.uid});
  }
}
