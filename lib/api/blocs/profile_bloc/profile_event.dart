import 'dart:io';

import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile_create/model/language_model.dart';
import 'package:tobeto/screens/profile_create/model/skills_model.dart';
import 'package:tobeto/screens/profile_create/model/social_media_model.dart';
import 'package:tobeto/screens/profile_create/widgets/form/skills.dart';

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

// Profil Fotoğrafını Yükle
class UploadPhotoEvent extends ProfileEvent {
  final File photo;

  UploadPhotoEvent({required this.photo});
}

// Sosyal Medya Hesabını Seç
class UpdateSocialMediaListEvent extends ProfileEvent {
  final List<SocialMediaData> selectedSocialMedia;

  UpdateSocialMediaListEvent(this.selectedSocialMedia);
}

// Yabancı Dil Seç
class UpdateLanguageEvent extends ProfileEvent {
  final List<LanguageData> selectedLanguage;

  UpdateLanguageEvent(this.selectedLanguage);
}

// Yetkinliklerim Seç
class UpdateSkillsEvent extends ProfileEvent {
  final List<SkillsData> selectedSkills;

  UpdateSkillsEvent(this.selectedSkills);
}
