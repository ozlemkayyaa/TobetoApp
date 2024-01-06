import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';

class ContainerStyleWidget extends StatelessWidget {
  const ContainerStyleWidget(
      {super.key,
      required this.gradientStartColor,
      required this.gradientEndColor,
      required this.buttonText,
      required this.containerTitle});

  final Color gradientStartColor;
  final Color gradientEndColor;
  final String buttonText;
  final String containerTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0), // sivri kenar
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              gradientStartColor,
              gradientEndColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              containerTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    buttonText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
