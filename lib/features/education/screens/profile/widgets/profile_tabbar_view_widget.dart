import 'package:flutter/material.dart';
import 'package:tobeto/features/education/screens/profile/widgets/form/eight_form.dart';
import 'package:tobeto/features/education/screens/profile/widgets/form/one_form.dart';
import 'package:tobeto/features/education/screens/profile/widgets/form/three_form.dart';
import 'package:tobeto/features/education/screens/profile/widgets/form/two_form.dart';

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
          Text("4"),
          Text("5"),
          Text("6"),
          Text("7"),
          EightForm(),
        ],
      ),
    );
  }
}
