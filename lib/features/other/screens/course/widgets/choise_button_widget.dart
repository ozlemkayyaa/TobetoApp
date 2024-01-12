import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ChoiseButtonWidget extends StatelessWidget {
  const ChoiseButtonWidget({
    super.key,
    required this.styleFrom,
    required this.buttonName,
  });

  final ButtonStyle styleFrom;
  final String buttonName;

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
            buttonName,
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
