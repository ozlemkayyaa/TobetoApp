import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Login User
  Future<void> loginUser(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Create User
  Future<void> registerUser(String email, String name, String surname,
      String phone, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Logout
  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }

  // Forgot Password
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.setLanguageCode('tr');
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // Change Password
  Future<void> changePassword(
      String newPassword, String confirmNewPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.updatePassword(newPassword);
    } else {
      throw Exception('Kullanıcı yok');
    }
  }

  // Delete
  Future<void> deleteUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    await user.delete();
  }
}
