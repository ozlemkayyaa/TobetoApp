import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/utils/constants/collection.dart';

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
          email: event.email,
          password: event.password,
        );

        // Kayıtlı Kullanıcı Giriş Yapınca Adı Ekranda Gözükür (Firestore'dan veri okunur)
        final userDoc = await _firebaseFirestore
            .collection(Collections.USERS)
            .doc(userCredential.user!.uid)
            .get();

        final userName = userDoc.data()?['name'];
        emit(Authenticated(user: userCredential.user, userName: userName));
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
            .collection(Collections.USERS)
            .doc(userCredential.user!.uid)
            .set({
          'email': event.email,
          'name': event.name,
          'surname': event.surname,
          'registerDate': DateTime.now(),
          'phone': event.phone
        });

        // Kayıt Olduktan Sonra Kişinin Adı Ekranda Gözükür (Firestore'dan veri okunur)
        final userDoc = await _firebaseFirestore
            .collection(Collections.USERS)
            .doc(userCredential.user!.uid)
            .get();

        final userName = userDoc.data()?['name'];
        emit(Authenticated(user: userCredential.user, userName: userName));
      } on FirebaseAuthException catch (e) {
        emit(NotAuthenticated(errorMessage: e.message));
      } catch (e) {
        // Firestore'a yazma hatası
        emit(NotAuthenticated(
            errorMessage: "Kullanıcı kaydedilemedi. Lütfen tekrar deneyin."));
      }
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
