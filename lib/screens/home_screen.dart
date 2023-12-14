import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('Home Screen Body'),
      ),
    );
  }
}
