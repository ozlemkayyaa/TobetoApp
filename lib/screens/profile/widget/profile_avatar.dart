import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedPhoto;

  Future pickImage() async {
    final photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (photo != null) {
        _selectedPhoto = File(photo.path);
        // Fotoğraf seçildiğinde, ProfileBloc'a UploadPhotoEvent'i gönder
        BlocProvider.of<ProfileBloc>(context)
            .add(UploadPhotoEvent(photo: _selectedPhoto!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          context.read<ProfileBloc>().add(FetchProfileEvent());
          // ProfileInitial veya ProfileUpdated durumları için bir widget dönüşü
          return Container(); // veya uygun bir widget
        }
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              color: dark ? TColors.darkerGrey : TColors.lightGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: TSizes.sm, bottom: TSizes.sm),
                    child: GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: _selectedPhoto != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  dark ? TColors.darkGrey : TColors.lightGrey,
                              backgroundImage: FileImage(_selectedPhoto!),
                            )
                          : const Image(
                              image: AssetImage(TImages.profileImage),
                              height: 100,
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(TTexts.student,
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      Text(TTexts.job,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: TSizes.sm),
                      const Row(
                        children: [
                          Image(
                              image: AssetImage(TImages.linkedin), height: 35),
                          Image(image: AssetImage(TImages.github), height: 30),
                          Image(
                              image: AssetImage(TImages.instagram), height: 37),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        // Varsayılan olarak bir widget dönüşü
        return Container(); // veya uygun bir widget
      },
    );
  }
}
