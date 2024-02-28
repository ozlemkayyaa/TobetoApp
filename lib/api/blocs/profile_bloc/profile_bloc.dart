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
  }

  // Profil Getir

  Future<void> _onFetchProfile(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = await _userRepository.fetchCurrentUser(UserModel());
      emit(ProfileLoaded(userModel: user));
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

  Future<void> _onUploadPhoto(
      UploadPhotoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await _storageRepository.uploadPhoto(event.photo);
      // Fotoğrafın URL'sini güncellemek için _userRepository.updateUser() çağrısı yapabilirsiniz.
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }
}
