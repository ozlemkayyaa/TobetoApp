import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class TabButtonWidget extends StatelessWidget {
  const TabButtonWidget({
    super.key,
    required this.styleFrom,
    required this.buttonName,
    required this.icon,
    required this.iconColor,
  });

  final ButtonStyle styleFrom;
  final String buttonName;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.xs),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: styleFrom,
          child: Padding(
            padding: const EdgeInsets.only(
                left: TSizes.iconXs, right: TSizes.iconXs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonName,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: TColors.black),
                ),
                Icon(
                  icon,
                  color: iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
