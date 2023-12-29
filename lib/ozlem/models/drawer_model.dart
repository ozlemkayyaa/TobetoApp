import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/constants/text_const.dart';
import 'package:tobeto/ozlem/models/list_tile_model.dart';
import 'package:tobeto/ozlem/screens/calendar_screen.dart';
import 'package:tobeto/ozlem/screens/cataloge_screen.dart';
import 'package:tobeto/ozlem/screens/home_screen.dart';
import 'package:tobeto/ozlem/screens/profile_screen.dart';
import 'package:tobeto/ozlem/screens/reviews_screen.dart';
import 'package:tobeto/ozlem/screens/tobeto_screen.dart';

class DrawerModel extends StatelessWidget {
  const DrawerModel({super.key});

  @override
  Widget build(BuildContext context) {
    late String logoImage;
    final Color textColor;
    final Color iconColor;

    final ThemeData theme = Theme.of(context);
    logoImage = Theme.of(context).brightness == Brightness.light
        ? lightLogoImage
        : darkLogoImage;
    textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black54
        : Colors.white;
    iconColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black45
        : Colors.white38;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Drawer Header
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      logoImage,
                      width: 150, // Resmin genişliği
                      height: 80, // Resmin yüksekliği
                    ),
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ])),

          // Drawer İçeriği
          Expanded(
              child: ListView(
                  padding: const EdgeInsets.only(left: 15.0),
                  children: <Widget>[
                // Anasayfa
                SizedBox(
                    height: 30.0,
                    child: ListTileModel(
                        title: homePage,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        })),

                // Değerlendirmeler
                SizedBox(
                    height: 30.0,
                    child: ListTileModel(
                        title: reviews,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReviewsScreen(),
                              ));
                        })),

                //Profilim
                SizedBox(
                    height: 30.0,
                    child: ListTileModel(
                        title: profile,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ));
                        })),

                // Katalog
                SizedBox(
                    height: 30.0,
                    child: ListTileModel(
                        title: cataloge,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CatalogeScreen(),
                              ));
                        })),

                // Takvim
                SizedBox(
                    height: 30.0,
                    child: ListTileModel(
                        title: calendar,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CalendarScreen(),
                              ));
                        })),

                // Çizgi
                SizedBox(
                    height: 30.0,
                    child: ListTile(
                        title: Container(
                      width: double.infinity,
                      height: 0.3,
                      color: Colors.grey,
                    ))),

                // Tobeto + Icon
                ListTileModel(
                    title: tobeto,
                    icon: Icons.home_outlined,
                    iconColor: iconColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TobetoScreen(),
                          ));
                    }),

                // Profil Kısmı
                ListTile(
                    title: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profileName,
                                style: TextStyle(color: textColor),
                              ),
                              Icon(
                                Icons.account_circle_outlined,
                                color: iconColor,
                                size: 30.0,
                              ),
                            ]))),

                // 2022 Tobeto Yazısı
                ListTileModel(
                  title: year,
                  icon: Icons.copyright_outlined,
                  iconColor: iconColor,
                  iconSize: 15.0,
                  onTap: () {},
                ),
              ]))
        ]);
  }
}
