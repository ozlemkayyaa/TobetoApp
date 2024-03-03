import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/catalog/data/training_data.dart';
import 'package:tobeto/screens/catalog/widgets/animate_page_widget.dart';
import 'package:tobeto/screens/catalog/widgets/catalog_header_widget.dart';
import 'package:tobeto/screens/catalog/widgets/filter_dialog_widget.dart';
import 'package:tobeto/screens/catalog/widgets/tarining_widget.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class CatalogeScreen extends StatefulWidget {
  const CatalogeScreen({super.key});

  @override
  State<CatalogeScreen> createState() => _CatalogeScreenState();
}

class _CatalogeScreenState extends State<CatalogeScreen> {
  final PageController _pageController = PageController();
  final int itemsPerPage = 5;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

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
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          // Sayfaların arasında gezebilmek için...
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: (trainingDataList.length / itemsPerPage).ceil(),
              itemBuilder: (context, index) {
                final start = index * itemsPerPage;
                final end = (index + 1) * itemsPerPage;
                final visibleTrainings = trainingDataList.sublist(
                    start, min(end, trainingDataList.length));

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Öğrnemeye başla yazısı, altındaki buton, arkasındaki resim
                      const CatalogHeaderWidget(),

                      // Filtrele Butonu
                      Padding(
                        padding: const EdgeInsets.all(TSizes.sm),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                buildFilterShowDialog(context);
                              },
                              child: const Text(TTexts.filter)),
                        ),
                      ),

                      // Eğitimlerin listelenmesi
                      Column(
                        children: visibleTrainings.map((training) {
                          return TrainingsWidget(
                            trainingPage: training.trainingPage,
                            title: training.title,
                            time: training.time,
                            image: training.image,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Sayfaları değiştirmeye yarayan kod parçaçığı
          AnimatePageWidget(
              itemsPerPage: itemsPerPage,
              pageController: _pageController,
              currentPage: currentPage),
        ],
      ),
    );
  }

// Filter butonuna basıldıktan sonra çıkan showDiaolg
  Future<dynamic> buildFilterShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AlertDialog(
                title: Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(TTexts.filter),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.clear)),
                    ],
                  ),
                ),
                // Filter butonuna basınca çıkan dialogdaki butonların hepsi bu widget'ın içinde
                content: const FilterDialogWidget(),
              ),
            );
          },
        );
      },
    );
  }
}
