import 'package:flutter/material.dart';

class ListTileModel extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const ListTileModel({
    required this.title,
    required this.onTap,
    this.icon,
    this.iconColor,
    this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color textColor =
        theme.brightness == Brightness.light ? Colors.black54 : Colors.white;

    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
