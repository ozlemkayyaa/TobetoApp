import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String data;
  final Icon selectIcon;
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.data,
    required this.selectIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.xs),
          child: selectIcon,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelMedium),
            Text(data, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ],
    );
  }
}
