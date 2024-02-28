import 'package:tobeto/model/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// İstek Atılıyor, Yükleniyor
class ProfileLoading extends ProfileState {
  // Circular progress indicator
}

// Yüklendi, Profil bilgileri ekranda gözükür.
class ProfileLoaded extends ProfileState {
  final UserModel userModel;
  ProfileLoaded({required this.userModel});
}

//  Veri Yoksa
class ProfileError extends ProfileState {
  String errorMessage;
  ProfileError({
    required this.errorMessage,
  });
}

// Profil güncellenirse

class ProfileUpdated extends ProfileState {}
