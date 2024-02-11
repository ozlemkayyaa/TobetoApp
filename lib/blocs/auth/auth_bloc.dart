import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/auth/auth_event.dart';
import 'package:tobeto/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthBloc({FirebaseAuth? firebaseAuth, FirebaseFirestore? firebaseFirestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(Initial()) {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(Authenticated(user: user));
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(NotAuthenticated());
      }
    });

    on<Login>((event, emit) async {
      try {
        UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        emit(Authenticated(user: userCredential.user));
      } on FirebaseAuthException catch (e) {
        emit(NotAuthenticated(errorMessage: e.message));
      }
    });

    on<Register>((event, emit) async {
      try {
        UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: event.email, password: event.password);
        await _firebaseFirestore
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          'email': event.email,
          'name': event.name,
          'surname': event.surname,
          'registerDate': DateTime.now(),
          'phone': event.phone
        });
        // ignore: empty_catches
      } on FirebaseAuthException {}
    });

    on<Logout>((event, emit) async {
      try {
        await _firebaseAuth.signOut();
        emit(
            NotAuthenticated()); // Kullanıcı çıkış yaptığında AuthState'i güncelleyin
      } catch (e) {
        // Çıkış yaparken bir hata oluştu
        // ignore: avoid_print
        print('Çıkış yaparken bir hata oluştu: $e');
      }
    });

    on<RememberMeChanged>((event, emit) {
      emit(RememberMeState(rememberMe: event.rememberMe));
    });
  }
}
