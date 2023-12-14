import 'package:flutter/material.dart';
import 'package:tobeto/models/drawer_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Tüm Drawer rengi
        child: const DrawerModel(),
      ),
    );
  }
}
