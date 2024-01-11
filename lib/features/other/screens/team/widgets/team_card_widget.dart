import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TeamCardWidget extends StatelessWidget {
  const TeamCardWidget(
      {super.key,
      required this.images,
      required this.name,
      required this.title});

  final String images;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      width: 180,
      height: 220,
      child: Card(
        elevation: 3,
        color: dark ? TColors.dark : TColors.white,
        surfaceTintColor: dark ? TColors.dark : TColors.white,
        child: Column(
          children: [
            Image(
              image: AssetImage(images),
              height: 140,
              width: double.infinity,
            ),
            const SizedBox(height: TSizes.xs),
            Text(name),
            const SizedBox(height: TSizes.xs),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
