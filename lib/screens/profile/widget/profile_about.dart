import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileInitial || state is ProfileUpdated) {
        context.read<ProfileBloc>().add(FetchProfileEvent());
      }
      if (state is ProfileLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProfileLoaded) {
        final UserModel userModel = state.userModel;
        final String about = userModel.description!;

        return Padding(
          padding: const EdgeInsets.only(
              bottom: TSizes.sm, left: TSizes.sm, right: TSizes.sm),
          child: Card(
            elevation: 3,
            color: dark ? TColors.darkerGrey : TColors.lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(TSizes.sm),
                        child: Text(TTexts.aboutMe,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateProfileScreen()),
                          );
                        },
                        icon: const Icon(Iconsax.edit),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: TSizes.sm),
                    child: Divider(
                      color: TColors.black,
                      height: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Text(about,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const Center(child: Text(TTexts.errorMessage));
    });
  }
}
