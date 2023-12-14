import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: const Center(
          child: Text('Profile Screen'),
        ),
      ),
    );
  }
}
