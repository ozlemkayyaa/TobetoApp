import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.name,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.eMail,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: TTexts.message,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
