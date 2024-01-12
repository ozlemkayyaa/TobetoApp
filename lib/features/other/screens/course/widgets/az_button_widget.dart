import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class AZButtonWidget extends StatelessWidget {
  const AZButtonWidget({
    super.key,
    required this.styleFrom,
  });

  final ButtonStyle styleFrom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.xs),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: styleFrom,
          child: Text(
            TTexts.az,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.black),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
