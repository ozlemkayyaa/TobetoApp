import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ExamWidget extends StatelessWidget {
  const ExamWidget({
    super.key,
    required this.title,
    required this.message,
    required this.testName,
  });

  final String title;
  final String message;
  final String testName;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [TColors.profile2, TColors.profile1]),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: dark ? TColors.black : TColors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(TSizes.sm),
            child: Icon(CupertinoIcons.list_bullet_below_rectangle,
                color: TColors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                testName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: TSizes.sm, top: TSizes.sm, right: TSizes.sm),
              child: ElevatedButton(
                onPressed: () {
                  THelperFunctions.showAlert2(title, message, context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: TColors.white,
                  side: const BorderSide(color: TColors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.appBarHeight),
                  ),
                ),
                child: Text(
                  TTexts.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: dark ? TColors.black : TColors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
