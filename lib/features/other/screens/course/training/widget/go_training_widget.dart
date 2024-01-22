import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/course/training/models/go_training_model.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class GoTrainingWidget extends StatelessWidget {
  const GoTrainingWidget({
    super.key,
    required this.lessonData,
  });

  final GoTrainingModel lessonData;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
        color: dark ? TColors.darkContainer : TColors.lightContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              color: dark ? TColors.black : TColors.white,
              surfaceTintColor: dark ? TColors.black : TColors.white,
              child: SizedBox(
                width: 360,
                child: Column(
                  children: [
                    // Eğitim Resmi
                    Image(
                      image: AssetImage(lessonData.image),
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 260,
                    ),
                    const SizedBox(height: TSizes.sm),

                    // Eğitim başlığı
                    Padding(
                      padding: const EdgeInsets.only(
                        left: TSizes.md,
                        bottom: TSizes.xs,
                      ),
                      child: Text(lessonData.title,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    const SizedBox(height: TSizes.sm),

                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.md),
                      child: Row(
                        children: [
                          const Text(TTexts.video),
                          Text(lessonData.time),
                          const SizedBox(width: TSizes.md),
                          const Icon(Icons.circle_rounded),
                          const SizedBox(width: TSizes.xs),
                          const Text(TTexts.notStart),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: TSizes.md, right: TSizes.md),
                      child: SizedBox(
                        width: double.infinity,
                        height: 47,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(5),
                                backgroundColor:
                                    dark ? TColors.black : TColors.white),
                            child: Text(
                              TTexts.detail,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: TColors.primary),
                            )),
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
