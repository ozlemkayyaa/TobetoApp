import 'dart:io';

import 'package:tobeto/model/user_model.dart';

abstract class ProfileEvent {}

// Profil Bilgilerini Getir

class FetchProfileEvent extends ProfileEvent {}

// Profil Bilgilerimi Güncelle
class UpdateProfileEvent extends ProfileEvent {
  UserModel user;
  File? photo;
  UpdateProfileEvent({
    required this.user,
    this.photo,
  });
}

// Profil Fotoğradını Yükle
class UploadPhotoEvent extends ProfileEvent {
  final File photo;

  UploadPhotoEvent({required this.photo});
}
