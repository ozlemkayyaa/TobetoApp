import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class OneForm extends StatelessWidget {
  const OneForm({
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
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signSurname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signSurname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signSurname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // E-Mail
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.signEmail,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signSurname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: TTexts.message,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: TTexts.message,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(TTexts.submit)),
            )
          ],
        ),
      ),
    ));
  }
}
