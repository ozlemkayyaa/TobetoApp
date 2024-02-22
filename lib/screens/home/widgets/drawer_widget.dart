import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/screens/contact/contact_screen.dart';
import 'package:tobeto/screens/team/team_screen.dart';
import 'package:tobeto/navigation_menu.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header
          Padding(
            padding: const EdgeInsets.only(
                top: TSizes.defaultSpace, left: TSizes.defaultSpace),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    dark ? TImages.darkAppLogo : TImages.lightAppLogo,
                    width: 150, // Resmin genişliği
                    height: 80, // Resmin yüksekliği
                  ),
                ]),
          ),

          // Drawer İçeriği
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              children: [
                // Biz Kimiz?
                SizedBox(
                    height: TSizes.spaceBtwSections + 10,
                    child: ListTile(
                        title: Row(
                          children: [
                            const Icon(CupertinoIcons.home),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace / 4),
                              child: Text(
                                TTexts.home,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationMenu(),
                              ));
                        })),

                // Ekibimiz
                SizedBox(
                    height: TSizes.spaceBtwSections + 10,
                    child: ListTile(
                        title: Row(
                          children: [
                            const Icon(CupertinoIcons.group),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace / 4),
                              child: Text(
                                TTexts.team,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TeamScreen(),
                              ));
                        })),

                // İletişim
                SizedBox(
                    height: TSizes.spaceBtwSections + 10,
                    child: ListTile(
                        title: Row(
                          children: [
                            const Icon(Iconsax.call),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace / 4),
                              child: Text(
                                TTexts.contactUs,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactScreen(),
                              ));
                        })),

                // Çıkış Yap Butonu
                SizedBox(
                    height: TSizes.spaceBtwSections,
                    child: ListTile(
                        title: Row(
                          children: [
                            const Icon(Iconsax.logout),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace / 4),
                              child: Text(
                                TTexts.logout,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                          Navigator.pop(context);
                        })),

                // Profil Kısmı
                const SizedBox(height: TSizes.spaceBtwSections),
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: dark ? TColors.darkGrey : TColors.grey),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            TTexts.profileName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Icon(
                            Iconsax.profile_circle,
                          ),
                        ]),
                  ),
                ),

                // 2024 Tobeto
                ListTile(
                  title: Row(
                    children: [
                      const Icon(Iconsax.copyright),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: TSizes.defaultSpace / 4),
                        child: Text(
                          TTexts.year,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
