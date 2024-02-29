import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/contact/message_screen.dart';
import 'package:tobeto/screens/contact/widgets/divider_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              const SizedBox(height: TSizes.defaultSpace),

              // İletişim Bilgileri
              Text(TTexts.information,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.defaultSpace),

              // Firma Adı
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.ad,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace),
                    Text(TTexts.companyName,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // Firma Unvan
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.unvan,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 20),
                    Text(TTexts.company,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // Vergi Dairesi
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.daire,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 16),
                    Text(TTexts.tax,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // Vergi No
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.no,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 2),
                    Text(TTexts.taxNo,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // Telefon
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.telefon,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 9),
                    Text(TTexts.tel,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // E-Posta
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.posta,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 9),
                    Text(TTexts.ePosta,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // Adres
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.adres,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 18),
                    Text(TTexts.adress,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),
              const SizedBox(height: TSizes.defaultSpace),

              // İstanbul Kodluyor İçin
              Text(TTexts.forIstCod,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.defaultSpace),

              // İst -> Tel
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.telefon,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 9),
                    Text(TTexts.telIstCod,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),

              // İst -> E-Posta
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(TTexts.posta,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: TSizes.defaultSpace + 9),
                    Text(TTexts.ePostaIstCod,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const DividerWidget(),
              const SizedBox(height: TSizes.appBarHeight),

              // Mesaj Bırakın Butonu
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageScreen()),
                      );
                    },
                    child: const Text(TTexts.messageButton)),
              )
            ],
          ),
        ));
  }
}
