import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile_create/model/language_model.dart';
import 'package:tobeto/screens/profile_create/model/skills_model.dart';
import 'package:tobeto/screens/profile_create/model/social_media_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel userModel;
  final List<SocialMediaData> selectedSocialMedia;
  final List<LanguageData> selectedLanguage;
  final List<SkillsData> selectedSkills;

  ProfileLoaded({
    required this.userModel,
    required this.selectedSocialMedia,
    required this.selectedLanguage,
    required this.selectedSkills,
  });

  ProfileLoaded copyWith({
    UserModel? userModel,
    List<SocialMediaData>? selectedSocialMedia,
    List<LanguageData>? selectedLanguage,
    List<SkillsData>? selectedSkills,
  }) {
    return ProfileLoaded(
      userModel: userModel ?? this.userModel,
      selectedSocialMedia: selectedSocialMedia ?? this.selectedSocialMedia,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedSkills: selectedSkills ?? this.selectedSkills,
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
