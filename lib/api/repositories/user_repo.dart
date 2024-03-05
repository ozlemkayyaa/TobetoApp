import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/utils/constants/collection.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Create => Ekleme
  Future<void> addUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.USERS);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(userModel.userId).set(userModel.toMap());
  }

  // Read => Firestore da veri getirme
  Future fetchCurrentUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.USERS);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    final DocumentSnapshot documentSnapshot =
        await users.doc(userModel.userId).get();
    if (documentSnapshot.exists) {
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Kullanıcı Yok!");
    }
  }

  // Update
  Future<void> updateUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.USERS);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(userModel.userId).update(userModel.toMap());
  }

  // Delete
  Future<void> deleteUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.USERS);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(userModel.userId).delete();
  }
}
