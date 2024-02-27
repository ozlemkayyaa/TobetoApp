import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/screens/profile/widget/profile_item_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
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
                    child: Text(TTexts.profileInformation,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProfileScreen()),
                      );
                    },
                    icon: const Icon(Iconsax.edit),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Divider(
                  color: TColors.black,
                  height: 0.5,
                ),
              ),

              // Doğum Tarihi
              const ProfileItemWidget(
                title: TTexts.birthdate,
                data: TTexts.studentBirthdate,
                selectIcon: Icon(Iconsax.calendar, size: 35),
              ),

              // Eğitim
              const ProfileItemWidget(
                title: TTexts.education,
                data: TTexts.licanseDegree,
                selectIcon: Icon(Icons.school_outlined, size: 35),
              ),

              // E-Mail
              const ProfileItemWidget(
                title: TTexts.postaAdress,
                data: TTexts.studentEMail,
                selectIcon: Icon(CupertinoIcons.mail, size: 35),
              ),

              // Telefon
              const ProfileItemWidget(
                title: TTexts.phoneNumber,
                data: TTexts.studentTelephoneNumber,
                selectIcon: Icon(Iconsax.call, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
