import 'dart:io';

import 'package:tobeto/model/user_model.dart';

abstract class ProfileEvent {}

// Profil Bilgilerini Getir

class FetchProfileEvent extends ProfileEvent {}

// Profil Bilgilerimi Güncelle
class UpdateProfileEvent extends ProfileEvent {
  final UserModel userModel;
  File? photo;
  UpdateProfileEvent({
    required this.userModel,
    this.photo,
  });
}

// Profil Fotoğradını Yükle
class UploadPhotoEvent extends ProfileEvent {
  final File photo;

  UploadPhotoEvent({required this.photo});
}
