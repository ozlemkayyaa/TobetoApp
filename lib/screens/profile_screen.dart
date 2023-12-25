import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text('Profile Screen'),
      ),
      drawer: const DrawerWidget(
        isDarkMode: true,
      ),
      body: const Center(
        child: Text('Profile Screen Body'),
      ),
    );
  }
}
