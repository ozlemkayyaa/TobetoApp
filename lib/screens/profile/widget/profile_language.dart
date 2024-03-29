import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/screens/profile_create/model/language_model.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileLanguage extends StatelessWidget {
  const ProfileLanguage({
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
        final List<LanguageData> languages = state.selectedLanguage;
        return Column(
          children: [
            Padding(
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
                            child: Text(TTexts.language,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
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
                      const Divider(color: TColors.black, height: 0.5),
                      const SizedBox(height: TSizes.sm),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: languages.map((language) {
                            return Text(language.name,
                                style: Theme.of(context).textTheme.bodyLarge);
                          }).toList()),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }
      return const Center(child: Text(TTexts.errorMessage));
    });
  }
}
