import 'package:flutter/material.dart';
import 'package:tobeto/features/education/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(dark ? TImages.darkAppLogo : TImages.lightAppLogo,
              fit: BoxFit.contain, height: 32),
        ]),
      ),
      endDrawer: const DrawerWidget(),
    );
  }
}
