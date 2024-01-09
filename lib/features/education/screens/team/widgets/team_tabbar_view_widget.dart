import 'package:flutter/material.dart';
import 'package:tobeto/features/education/screens/team/widgets/team_card_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class TeamTabBarViewWidget extends StatelessWidget {
  const TeamTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.kurucuDirektor,
                        name: TTexts.elif,
                        title: TTexts.elifTitle),
                    SizedBox(width: TSizes.xs),
                    TeamCardWidget(
                        images: TImages.egitimDirektor,
                        name: TTexts.kader,
                        title: TTexts.kaderTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.pelinHoca,
                        name: TTexts.pelin,
                        title: TTexts.pelinTitle),
                    SizedBox(width: TSizes.xs),
                    TeamCardWidget(
                        images: TImages.gurkanHoca,
                        name: TTexts.gurkan,
                        title: TTexts.gurkanTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.ismailHoca,
                        name: TTexts.ismail,
                        title: TTexts.ismailTitle),
                    SizedBox(width: TSizes.xs),
                    TeamCardWidget(
                        images: TImages.selimHoca,
                        name: TTexts.ahmet,
                        title: TTexts.ahmetTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.dogukanHoca,
                        name: TTexts.dogu,
                        title: TTexts.doguTitle),
                    SizedBox(width: TSizes.xs),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.ahmetHoca,
                        name: TTexts.ahmetHancer,
                        title: TTexts.ahmetHancerTitle),
                    SizedBox(width: TSizes.xs),
                    TeamCardWidget(
                        images: TImages.ecmelHoca2,
                        name: TTexts.ecmelHoca,
                        title: TTexts.ecmelHocaTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.cemHoca,
                        name: TTexts.cem,
                        title: TTexts.cemTitle),
                    SizedBox(width: TSizes.xs),
                    TeamCardWidget(
                        images: TImages.mehmetHoca,
                        name: TTexts.mehmet,
                        title: TTexts.mehmetTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamCardWidget(
                        images: TImages.alpHoca,
                        name: TTexts.alp,
                        title: TTexts.alpTitle),
                    SizedBox(width: TSizes.xs),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
