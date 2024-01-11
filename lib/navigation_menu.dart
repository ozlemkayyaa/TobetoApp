import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/profile/profile_screen.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/features/other/screens/home/home_screen.dart';
import 'package:tobeto/features/other/screens/test/test_screen.dart';
import 'package:tobeto/features/other/screens/calendar/calendar_screen.dart';
import 'package:tobeto/features/other/screens/cataloge/cataloge_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const TestScreen(),
    const CatalogeScreen(),
    const CalendarScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Seçilen sayfayı göster
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          // Tıklanan sayfayı göstermek için
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.home_2), label: TTexts.home),
          BottomNavigationBarItem(icon: Icon(Iconsax.edit), label: TTexts.test),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.category), label: TTexts.cataloge),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.calendar), label: TTexts.calendar),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.user), label: TTexts.profile),
        ],
      ),
    );
  }
}
