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
}
