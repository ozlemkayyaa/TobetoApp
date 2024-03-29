import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.navigateTo,
  });

  final String title;
  final String date;
  final String image;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Card(
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.buttonRadius),
            color: dark ? TColors.darkContainer : TColors.lightContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Eğitim Resmi
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 100,
                ),
                const SizedBox(height: TSizes.sm),

                // Eğitim başlığı
                Text(title, style: Theme.of(context).textTheme.titleLarge),

                // Eğitim Tarihi
                Text(date, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: TSizes.md),

                // Eğitime Git Butonu
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => navigateTo),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: dark ? TColors.darkGrey : TColors.grey,
                        padding:
                            const EdgeInsets.symmetric(vertical: TSizes.iconXs),
                        side: BorderSide(
                            color: dark ? TColors.darkGrey : TColors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.defaultSpace))),
                    child: Text(TTexts.goEducation,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
