import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/profile/widgets/form/eight_form.dart';
import 'package:tobeto/features/other/screens/profile/widgets/form/one_form.dart';
import 'package:tobeto/features/other/screens/profile/widgets/form/three_form.dart';
import 'package:tobeto/features/other/screens/profile/widgets/form/two_form.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          OneForm(),
          TwoForm(),
          ThreeForm(),
          EightForm(),
        ],
      ),
    );
  }
}
