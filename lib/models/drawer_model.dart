import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/models/list_tile_model.dart';
import 'package:tobeto/screens/calendar_screen.dart';
import 'package:tobeto/screens/cataloge_screen.dart';
import 'package:tobeto/screens/home_screen.dart';
import 'package:tobeto/screens/profile_screen.dart';
import 'package:tobeto/screens/reviews_screen.dart';
import 'package:tobeto/screens/tobeto_screen.dart';

class DrawerModel extends StatelessWidget {
  const DrawerModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String logoImage;
    final Color textColor;
    final ThemeData theme = Theme.of(context);
    logoImage = Theme.of(context).brightness == Brightness.light
        ? lightLogoImage
        : darkLogoImage;
    textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;

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
                    iconColor: Colors.black45,
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
                              const Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black45,
                                size: 30.0,
                              ),
                            ]))),

                // 2022 Tobeto Yazısı
                ListTileModel(
                  title: year,
                  icon: Icons.copyright_outlined,
                  iconColor: Colors.black45,
                  iconSize: 15.0,
                  onTap: () {},
                ),
              ]))
        ]);
  }
}
