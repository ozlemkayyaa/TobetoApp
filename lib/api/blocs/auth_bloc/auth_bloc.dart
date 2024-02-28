import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/api/repositories/auth_repo.dart';
import 'package:tobeto/api/repositories/user_repo.dart';
import 'package:tobeto/model/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final FirebaseAuth _firebaseAuth; // id mi çağırıyorum.

  AuthBloc(this._authRepository, this._userRepository,
      {FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);

    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(Authenticated(user: user));
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(NotAuthenticated());
      }
    });
  }

  // Login => Kullanıcı Girişi

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.loginUser(event.email, event.password);
      final UserModel userModel =
          await _userRepository.fetchCurrentUser(UserModel());
      final String? userName = userModel.name;
      final String? surName = userModel.surname;
      emit(Authenticated(
          user: _firebaseAuth.currentUser,
          userName: userName,
          surName: surName));
    } on FirebaseAuthException catch (e) {
      emit(NotAuthenticated(errorMessage: e.message));
    }
  }

  // Register => Kullanıcı Oluşturma
  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.registerUser(
          event.email, event.name, event.surname, event.phone, event.password);
      await _userRepository.addUser(UserModel(
          email: event.email,
          name: event.name,
          surname: event.surname,
          phone: event.phone));
      final userName = event.name;
      emit(Authenticated(user: _firebaseAuth.currentUser!, userName: userName));
    } on FirebaseAuthException catch (e) {
      emit(NotAuthenticated(errorMessage: e.message));
    } catch (e) {
      // Firestore'a yazma hatası
      emit(NotAuthenticated(
          errorMessage: "Kullanıcı kaydedilemedi. Lütfen tekrar deneyin."));
    }
  }

  // Logout => Çıkış Yapma
  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.logoutUser();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
