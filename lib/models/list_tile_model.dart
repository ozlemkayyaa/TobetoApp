import 'package:flutter/material.dart';

class ListTileModel extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  // final Color? iconColor;
  final double? iconSize;
  // final Widget? customWidget;

  const ListTileModel({
    required this.title,
    required this.onTap,
    this.icon,
    // this.iconColor,
    this.iconSize,
    // this.customWidget,
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
              color: theme.iconTheme.color,
              size: iconSize,
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
