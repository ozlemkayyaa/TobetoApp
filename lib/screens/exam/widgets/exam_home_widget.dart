import 'package:flutter/material.dart';

import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ExamHomeWidget extends StatelessWidget {
  const ExamHomeWidget({
    super.key,
    required this.title,
    required this.message,
    required this.examTitle,
    required this.classTitle,
    required this.examTime,
  });

  final String title;
  final String message;
  final String examTitle;
  final String classTitle;
  final String examTime;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.buttonRadius),
            color: dark ? TColors.darkContainer : TColors.lightGrey,
          ),
          child: InkWell(
            onTap: () {
              THelperFunctions.showAlert2(title, message, context);
            },
            child: Padding(
              padding: const EdgeInsets.all(TSizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sınavın Adı
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: TSizes.xs),
                          child: Text(
                            examTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      const Icon(Icons.check_box,
                          color: TColors.secondary,
                          size: TSizes.spaceBtwSections),
                    ],
                  ),

                  // Sınıf Adı
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
                    child: Text(classTitle,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),

                  // Süre
                  Row(
                    children: [
                      const Icon(Icons.alarm_outlined, color: TColors.primary),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: TSizes.sm),
                        child: Text(examTime,
                            style: Theme.of(context).textTheme.titleLarge),
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
