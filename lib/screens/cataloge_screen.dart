import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class CatalogeScreen extends StatelessWidget {
  const CatalogeScreen({super.key});

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
        title: const Text('Cataloge Screen'),
      ),
      drawer: DrawerWidget(
        isDarkMode: true,
      ),
      body: const Center(
        child: Text('Cataloge Screen Body'),
      ),
    );
  }
}
