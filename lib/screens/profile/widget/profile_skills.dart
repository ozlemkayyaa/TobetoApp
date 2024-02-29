import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/screens/profile_create/model/skills_model.dart';

import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileSkills extends StatefulWidget {
  const ProfileSkills({
    super.key,
  });

  @override
  State<ProfileSkills> createState() => _ProfileSkillsState();
}

class _ProfileSkillsState extends State<ProfileSkills> {
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
        final List<SkillsData> skills = state.selectedSkills;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: TSizes.sm, left: TSizes.sm, right: TSizes.sm),
              child: Card(
                elevation: 3,
                color: dark ? TColors.darkerGrey : TColors.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(TTexts.skills,
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
                          children: skills.map((skillsData) {
                            return Text(skillsData.skills,
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
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
