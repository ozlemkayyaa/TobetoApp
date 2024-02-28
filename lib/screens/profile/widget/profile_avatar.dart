import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile_create/model/social_media_model.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
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
        BlocProvider.of<ProfileBloc>(context)
            .add(UploadPhotoEvent(photo: _selectedPhoto!));
        context.read<ProfileBloc>().add(FetchProfileEvent());
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
          return Container();
        }

        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProfileLoaded) {
          final UserModel userModel = state.userModel;
          final String name = userModel.name!;
          final String surname = userModel.surname!;
          final List<SocialMediaData> selectedSocialMedia =
              state.selectedSocialMedia;

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
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            dark ? TColors.darkGrey : TColors.lightGrey,
                        backgroundImage: userModel.profilePhoto != null
                            ? NetworkImage(userModel.profilePhoto!)
                            : const AssetImage(TImages.profileImage)
                                as ImageProvider,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$name $surname',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: TSizes.sm),
                      Row(
                        children: _buildSocialMediaIcons(selectedSocialMedia),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  List<Widget> _buildSocialMediaIcons(
      List<SocialMediaData> selectedSocialMedia) {
    List<Widget> icons = [];

    for (var socialMedia in selectedSocialMedia) {
      switch (socialMedia.name) {
        case 'Github':
          icons.add(const Image(image: AssetImage(TImages.github), height: 30));
          break;
        case 'Linkedin':
          icons.add(
              const Image(image: AssetImage(TImages.linkedin), height: 35));
          break;
        case 'Instagram':
          icons.add(
              const Image(image: AssetImage(TImages.instagram), height: 37));
          break;
        // Diğer sosyal medya hesaplarını buraya ekleyebilirsiniz.
        default:
          break;
      }
    }

    return icons;
  }
}
