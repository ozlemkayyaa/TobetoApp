import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class ThreeForm extends StatelessWidget {
  const ThreeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        children: [
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.level,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.university,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.faculty,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.firstYear,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: TTexts.graduationYear,
                ),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(TTexts.continueLearn),
                ],
              ),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(TTexts.save)),
          )
        ],
      ),
    ));
  }
}
