import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/screens/contact/widgets/divider_widget.dart';
import 'package:tobeto/features/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/screens/profile/create_profile/create_profile_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: 18),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 375,
              //height: 700,
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color:
                        dark ? TColors.darkContainer : TColors.lightContainer,
                    surfaceTintColor:
                        dark ? TColors.darkContainer : TColors.lightContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 280),
                            child: IconButton(
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
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                dark ? TColors.darkGrey : TColors.lightGrey,
                            backgroundImage:
                                const AssetImage(TImages.profileImage),
                          ),
                          const SizedBox(height: TSizes.defaultSpace),
                          Row(
                            children: [
                              const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(TSizes.xs),
                                  child: Icon(
                                    Iconsax.user,
                                    size: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 28.0),
                                    child: Text(TTexts.nameSurname,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ),
                                  Text(TTexts.student,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(TSizes.xs),
                                  child: Icon(
                                    Iconsax.calendar,
                                    size: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Text(TTexts.birthdate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ),
                                  Text(TTexts.studentBirthdate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(TSizes.xs),
                                  child: Icon(
                                    CupertinoIcons.mail,
                                    size: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 66.0),
                                    child: Text(TTexts.postaAdress,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ),
                                  Text(TTexts.studentEMail,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(TSizes.xs),
                                  child: Icon(
                                    Iconsax.call,
                                    size: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: TSizes.spaceBtwItems),
                                    child: Text(TTexts.phoneNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ),
                                  Text(TTexts.studentTelephoneNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  const SizedBox(width: TSizes.spaceBtwItems),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.defaultSpace),
                    child: SizedBox(
                      height: 150,
                      child: Card(
                        surfaceTintColor: dark
                            ? TColors.darkContainer
                            : TColors.lightContainer,
                        color: dark
                            ? TColors.darkContainer
                            : TColors.lightContainer,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: TSizes.md, left: TSizes.md),
                              child: Text(TTexts.aboutMe,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                            const DividerWidget(),
                            Padding(
                              padding: const EdgeInsets.all(TSizes.md),
                              child: Text(TTexts.about,
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
