import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TrainingsWidget extends StatelessWidget {
  const TrainingsWidget({
    super.key,
    required this.title,
    required this.time,
    required this.image,
    required this.trainingPage,
  });

  final String title;
  final String time;
  final String image;
  final Widget trainingPage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => trainingPage),
        );
      },
      child: Card(
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.buttonRadius),
            color: dark ? TColors.darkContainer : TColors.lightContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Eğitim Resmi
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                const SizedBox(height: TSizes.sm),

                Row(
                  children: [
                    const Icon(Iconsax.user),
                    const Text(TTexts.teacher),
                    const Icon(Iconsax.clock),
                    Text(time),
                  ],
                ),
                const SizedBox(height: TSizes.sm),

                // Eğitim başlığı
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: TSizes.sm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
