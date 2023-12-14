import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/models/custom_listTile.dart';
import 'package:tobeto/screens/calendar_screen.dart';
import 'package:tobeto/screens/cataloge_screen.dart';
import 'package:tobeto/screens/home_screen.dart';
import 'package:tobeto/screens/profile_screen.dart';
import 'package:tobeto/screens/reviews_screen.dart';
import 'package:tobeto/screens/tobeto_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              logoImage,
            ),
          ),
          CustomListTile(
              title: homePage,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }),
          CustomListTile(
              title: reviews,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReviewsScreen()));
              }),
          CustomListTile(
              title: profile,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              }),
          CustomListTile(
              title: cataloge,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CatalogeScreen()));
              }),
          SizedBox(
            height: 30.0,
            child: CustomListTile(
                title: calendar,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarScreen()));
                }),
          ),
          SizedBox(
            height: 20.0,
            child: ListTile(
              title: Container(
                width: double.infinity,
                height: 0.3,
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TobetoScreen()));
            },
            title: const Row(
              children: [
                Text(tobeto),
                Icon(Icons.home_outlined),
              ],
            ),
          ),
          ListTile(
            title: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jack Brown"),
                  Icon(Icons.account_circle_outlined)
                ],
              ),
            ),
          ),
          const ListTile(
              title: Row(
            children: [Icon(Icons.copyright_outlined), Text('2022 Tobeto')],
          )),
        ],
      ),
    );
  }
}
