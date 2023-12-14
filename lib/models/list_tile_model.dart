import 'package:flutter/material.dart';

class ListTileModel extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Widget? customWidget;

  const ListTileModel({
    required this.title,
    required this.onTap,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.customWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
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
