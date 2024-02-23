import 'package:flutter/material.dart';

class ProfileSkillsButtonWidget extends StatelessWidget {
  final String skills;
  const ProfileSkillsButtonWidget({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 10, // Yatay iç boşluk
              vertical: 10, // Dikey iç boşluk
            ),
          ),
        ),
        onPressed: () {},
        child: Text(skills));
  }
}
