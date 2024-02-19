import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({
    super.key,
    required this.announcement,
    required this.dateTime,
  });

  final String announcement;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Card(
          child: Container(
            width: 390,
            height: 151,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius),
              color: dark ? TColors.darkContainer : TColors.lightContainer,
              border: const Border(
                left: BorderSide(
                  color: TColors.secondary,
                  width: TSizes.sm,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TTexts.announce,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.secondary),
                      ),
                      Text(
                        TTexts.istanbulKodluyor,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.secondary),
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(announcement,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: TSizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateTime,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          // Alert Dialog gelecek
                        },
                        child: Text(
                          TTexts.continueRead,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
