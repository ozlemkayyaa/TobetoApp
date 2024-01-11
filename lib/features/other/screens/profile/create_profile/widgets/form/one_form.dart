import 'package:flutter/cupertino.dart';
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
                    keyboardType: TextInputType.phone,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signPhoneNumber,
                      prefixIcon: Icon(Iconsax.call),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.birthdate,
                      prefixIcon: Icon(Iconsax.calendar),
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
                    keyboardType: TextInputType.number,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.tc,
                      prefixIcon: Icon(Iconsax.personalcard),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.signEmail,
                      prefixIcon: Icon(CupertinoIcons.mail),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // E-Mail
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.country,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.city,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.ilce,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: TTexts.street,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: TTexts.me,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
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
