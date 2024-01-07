import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/constants/text_const.dart';
import 'package:tobeto/ozlem/widget/drawer_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/bottom_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/exam_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/card_tab_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/homepage_richtext_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/learning_container_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/profile_container_widget.dart';
import 'package:tobeto/ozlem/widget/homepage_widgets/yourself_container_widget.dart';

void main() => runApp(const MaterialApp());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    //var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(isDarkMode ? darkLogoImage : lightLogoImage,
                fit: BoxFit.contain, height: 32),
          ]),
        ),
        endDrawer: const DrawerWidget(
          isDarkMode: false,
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // En baştaki TOBETO Renkli yazısı
              HomepageRichText(),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
                child: Text(
                  introduction,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // İstnabul Kodluyor resmi, yazı, ve sekme geçişleri
              CardTabWidget(),
              Padding(padding: EdgeInsets.all(5.0)),

              // Sınavlarım Kartı
              //CardExamWidget(),

              //Profilini Oluştur Kutucuğu
              ProfileContainerWidget(),

              // Kendini Değerlendir Kutucuğu
              YourselfContainerWidget(),

              // Öğrenmeye Başla kutucuğu
              LearningContainerWidget(),

              //En alttaki BottomBar tasarımı, tobeto img ve bize ulaşın butonu
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
