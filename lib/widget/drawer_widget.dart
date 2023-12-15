import 'package:flutter/material.dart';

import 'package:tobeto/models/drawer_model.dart';
import 'package:tobeto/themes/app_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    ThemeData selectedTheme =
        isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

    return Drawer(
      child: Container(
        color: selectedTheme.scaffoldBackgroundColor,
        child: const DrawerModel(),
      ),
    );
  }
}
