import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/authentication/screens/signup/successful.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.clear)),
        ],
        title: const Icon(Iconsax.information),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Text(TTexts.dialogTitle,
                style: Theme.of(context).textTheme.headlineSmall),
          ),

          // Kişisel verileriniz Aydınlatma Metni kapsamında işlenmektedir.
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.dialogSubTitle} ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        text: TTexts.lightText,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                          text: '${TTexts.dialogSubTitleContinue} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Açık rıza metni'ni okudum anladım.
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(value: true, onChanged: (value) {})),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: TTexts.openText,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                          text: '${TTexts.openTextContinue} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Üyelik Sözleşmesini ve Kullanım Koşullarını okudum ve anladım.
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(value: true, onChanged: (value) {})),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                          text: '${TTexts.read} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // İletişim bilgilerim üzerinden pazarlama ve tanıtım...
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.contact} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // E posta gönderim izni
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(value: true, onChanged: (value) {})),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.emailcontact} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Arama izni
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Row(
              children: [
                SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(value: true, onChanged: (value) {})),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.callcontact} ',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Devam et butonu
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Successful()),
                );
              },
              child: const Text(TTexts.continueSignUp),
            ),
          ),
        ],
      ),
    );
  }
}
