import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class TobetoScreen extends StatelessWidget {
  const TobetoScreen({super.key});

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
        title: const Text('Tobeto Screen'),
      ),
      drawer: const DrawerWidget(
        isDarkMode: false,
      ),
      body: const Center(
        child: Text('Tobeto Body'),
      ),
    );
  }
}
