import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/education/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/education/screens/team/controller/data_model.dart';
import 'package:tobeto/features/education/screens/team/widgets/team_tabbar_view_widget.dart';
import 'package:tobeto/features/education/screens/team/widgets/team_tabbar_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(TImages.appBarLogo, height: 18),
          ]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace),
              child: Icon(Iconsax.profile_circle),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: const Column(
          children: [
            TeamTabBarWidget(),
            TeamTabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
