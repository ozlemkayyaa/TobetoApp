import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class TwoForm extends StatelessWidget {
  const TwoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.companyNames,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.position,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.sector,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.citySelect,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.startYear,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.finalyear,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text(TTexts.workContinue),
              ],
            ),
            const SizedBox(height: TSizes.inputFieldRadius),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: TTexts.explainJob,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(TTexts.save)),
            )
          ],
        ),
      ),
    ));
  }
}
