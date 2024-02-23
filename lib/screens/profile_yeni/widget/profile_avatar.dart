import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        color: dark ? TColors.darkerGrey : TColors.lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm),
              child: Stack(alignment: Alignment.bottomRight, children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: dark ? TColors.darkGrey : TColors.lightGrey,
                  backgroundImage: const AssetImage(TImages.profileImage),
                ),
                IconButton(
                  onPressed: () {
                    // Düzenleme butonu işlevleri
                  },
                  icon: const Icon(Iconsax.edit),
                  iconSize: 30,
                ),
              ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(TTexts.student,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Text("Mobile Developer",
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: TSizes.sm),
                const Row(
                  children: [
                    Image(image: AssetImage(TImages.linkedin), height: 35),
                    Image(image: AssetImage(TImages.github), height: 30),
                    Image(image: AssetImage(TImages.instagram), height: 37),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
