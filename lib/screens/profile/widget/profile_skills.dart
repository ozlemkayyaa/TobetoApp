import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/screens/profile/widget/profile_skills_button_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

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
                  const Divider(
                    color: TColors.black,
                    height: 0.5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(TSizes.md),
                    child: Row(
                      children: [
                        ProfileSkillsButtonWidget(skills: "Algoritmalar"),
                        SizedBox(width: TSizes.sm),
                        ProfileSkillsButtonWidget(skills: "Aktif Öğrenme"),
                        SizedBox(width: TSizes.sm),
                        ProfileSkillsButtonWidget(skills: "İletişim"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
