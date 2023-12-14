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
  const DrawerModel({super.key});

  @override
  Widget build(BuildContext context) {
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
                },
              ),
            ],
          ),
        ),

        // Drawer İçeriği
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 15.0),
            children: <Widget>[
              SizedBox(
                height: 30.0,
                child: ListTileModel(
                  title: homePage, // Anasayfa
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
                child: ListTileModel(
                  title: reviews, // Değerlendirmeler
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewsScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
                child: ListTileModel(
                  title: profile, //Profilim
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
                child: ListTileModel(
                  title: cataloge, // Katalog
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CatalogeScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
                child: ListTileModel(
                  title: calendar, // Takvim
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarScreen(),
                      ),
                    );
                  },
                ),
              ),

              // Çizgi
              SizedBox(
                height: 30.0,
                child: ListTile(
                  title: Container(
                    width: double.infinity,
                    height: 0.3,
                    color: Colors.grey,
                  ),
                ),
              ),

              // Tobeto + Icon
              ListTileModel(
                  title: tobeto,
                  icon: Icons.home_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TobetoScreen(),
                      ),
                    );
                  }),

              // Profil Kısmı
              ListTile(
                title: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        profileName,
                      ),
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black38,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),

              // 2022 Tobeto Yazısı
              ListTileModel(
                title: year,
                icon: Icons.copyright_outlined,
                iconSize: 15.0,
                iconColor: Colors.black38,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
