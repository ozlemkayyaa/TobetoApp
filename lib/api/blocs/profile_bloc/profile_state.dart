import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile_create/model/language_model.dart';
import 'package:tobeto/screens/profile_create/model/social_media_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel userModel;
  final List<SocialMediaData> selectedSocialMedia;
  final List<LanguageData> selectedLanguage;

  ProfileLoaded({
    required this.userModel,
    required this.selectedSocialMedia,
    required this.selectedLanguage,
  });

  ProfileLoaded copyWith({
    UserModel? userModel,
    List<SocialMediaData>? selectedSocialMedia,
    List<LanguageData>? selectedLanguage,
  }) {
    return ProfileLoaded(
      userModel: userModel ?? this.userModel,
      selectedSocialMedia: selectedSocialMedia ?? this.selectedSocialMedia,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

class ProfileError extends ProfileState {
  String errorMessage;

  ProfileError({
    required this.errorMessage,
  });
}

class ProfileUpdated extends ProfileState {}
