import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';

class ContainerStyleWidget extends StatelessWidget {
  const ContainerStyleWidget(
      {super.key,
      required this.gradientStartColor,
      required this.gradientEndColor,
      required this.buttonText,
      required this.containerTitle});

  final Color gradientStartColor;
  final Color gradientEndColor;
  final String buttonText;
  final String containerTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0), // sivri kenar
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              gradientStartColor,
              gradientEndColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              containerTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    buttonText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* Bunları tasarladım ama kullanmadım, bu kod homapage sayfasında aradığın iş burada yazısı yerine yazıldı,
bu yazıyı yazmayıp hazıladığım containerları kullanıcaktım.
Buradaki kodda profilini oluştur, kendini değerlerdir gibi container widgetlar bulunmakta,
bu widgetların yönelndirildiği sayfalar bottom barda verildiği için bu widgetları anasayfadan kaldırdım, 
ama sayfa olarak uygulama içinde mevcutlar.

                  ContainerIstkodWidget(),
                  ContainerStyleWidget(
                      gradientStartColor: TColors.profile1,
                      gradientEndColor: TColors.profile2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.createProfile),
                  ContainerStyleWidget(
                      gradientStartColor: TColors.yourself1,
                      gradientEndColor: TColors.yourself2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.yourself),
                  ContainerStyleWidget(
                      gradientStartColor: TColors.learning1,
                      gradientEndColor: TColors.learning2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.startLearning),
                  */