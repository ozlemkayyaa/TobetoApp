import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/common/styles/widgets/success_screen/success_screen.dart';
import 'package:tobeto/features/authentication/screens/signup/verify_email_screen.dart';
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
          Row(
            children: [
              const SizedBox(
                height: 24,
                width: 6,
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
          // İşlenmektedir kısmı aşağı kaymayınca böyle yaptım.
          Row(
            children: [
              const SizedBox(
                height: 16,
                width: 6,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.dialogSubCont} ',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          ),

          // Açık rıza metni'ni okudum anladım.
          Row(
            children: [
              SizedBox(
                  height: 24,
                  width: 30,
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

          // Üyelik Sözleşmesini ve Kullanım Koşullarını okudum ve anladım.
          Row(
            children: [
              SizedBox(
                  height: 24,
                  width: 30,
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

          // ve anladım kısmı aşağı kaymadı bende böyle yaptım.
          Row(
            children: [
              const SizedBox(
                height: 16,
                width: 6,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.understand} ',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          ),

          // İletişim bilgilerim üzerinden pazarlama ve tanıtım...
          Row(
            children: [
              const SizedBox(
                height: 24,
                width: 6,
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
          Row(
            children: [
              const SizedBox(
                height: 16,
                width: 6,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.contactGoal} ',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          ),

          // E posta gönderim izni
          Row(
            children: [
              SizedBox(
                  height: 24,
                  width: 30,
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

          // Arama izni
          Row(
            children: [
              SizedBox(
                  height: 24,
                  width: 30,
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

          // Devam et butonu
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: 315,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifyEmailScreen()),
                );
              },
              child: const Text(TTexts.continueSignUp),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
