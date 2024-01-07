import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.announcement,
    required this.dateTime,
  });

  final String announcement;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            width: 370,
            height: 148,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius),
              color: TColors.lightGrey,
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
                            .labelMedium!
                            .apply(color: TColors.secondary),
                      ),
                      Text(
                        TTexts.istanbulKodluyor,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
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
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          // Alert Dialog gelecek
                        },
                        child: Text(
                          TTexts.continueRead,
                          style: Theme.of(context).textTheme.labelMedium,
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
