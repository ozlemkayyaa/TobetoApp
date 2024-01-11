import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/contact/message_form.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: 18),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              const SizedBox(height: TSizes.defaultSpace),
              Text(TTexts.contactForm,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.defaultSpace),

              // Mesaj Formu
              const MessageForm(),
              const SizedBox(height: TSizes.defaultSpace),

              //
              //const Text(TTexts.formAlert, textAlign: TextAlign.center),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.formAlert} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: TTexts.lightText,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: dark ? TColors.white : TColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    TextSpan(
                        text: '${TTexts.alertContinue} ',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.appBarHeight),

              // Gönder Butonu
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(TTexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
