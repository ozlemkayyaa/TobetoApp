import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/api/repositories/storage_repo.dart';
import 'package:tobeto/api/repositories/user_repo.dart';
import 'package:tobeto/model/user_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;
  ProfileBloc(
    this._userRepository,
    this._storageRepository,
  ) : super(ProfileInitial()) {
    on<FetchProfileEvent>(_onFetchProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UploadPhotoEvent>(_onUploadPhoto);
    on<UpdateSocialMediaListEvent>(_onUpdateSocialMediaListEvent);
    on<UpdateLanguageEvent>(_onUpdateLanguageEvent);
    on<UpdateSkillsEvent>(_onUpdateSkillsEvent);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  // Profil Getir

  Future<void> _onFetchProfile(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = await _userRepository.fetchCurrentUser(UserModel());
      emit(ProfileLoaded(
          userModel: user,
          selectedSocialMedia: [],
          selectedLanguage: [],
          selectedSkills: []));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

// Verileri Güncelle

  Future<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await _userRepository.updateUser(event.userModel);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

  // Fotoğrafı Güncelle
  Future<void> _onUploadPhoto(
      UploadPhotoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final currentState = state;
      if (currentState is ProfileLoaded) {
        // Fotoğrafı depola (örneğin Firebase Storage'a yükle)
        final photoUrl = await _storageRepository.uploadPhoto(event.photo);

        // Kullanıcı modelini fotoğraf URL'si ile güncelle
        final updatedUser =
            currentState.userModel.copyWith(profilePhoto: photoUrl);

        // Güncellenmiş kullanıcı modeliyle ProfileLoaded durumunu güncelle
        emit(ProfileLoaded(
            userModel: updatedUser,
            selectedSocialMedia: currentState.selectedSocialMedia,
            selectedLanguage: currentState.selectedLanguage,
            selectedSkills: currentState.selectedSkills));
      }
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

  // Sosyal Medya Hesaplarını görünür yap
  void _onUpdateSocialMediaListEvent(
      UpdateSocialMediaListEvent event, Emitter<ProfileState> emit) {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(
          selectedSocialMedia: event.selectedSocialMedia));
    }
  }

// Yabancı Dil Seç
  void _onUpdateLanguageEvent(
      UpdateLanguageEvent event, Emitter<ProfileState> emit) {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(selectedLanguage: event.selectedLanguage));
    }
  }

  // Yetkinliklerim seç
  void _onUpdateSkillsEvent(
      UpdateSkillsEvent event, Emitter<ProfileState> emit) {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(selectedSkills: event.selectedSkills));
    }
  }

  // Kullanıcıyı sil
  Future<void> _onDeleteUser(
      DeleteUserEvent event, Emitter<ProfileState> emit) async {
    try {
      await _userRepository.deleteUser(UserModel());
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: (e.toString())));
    }
  }
}
