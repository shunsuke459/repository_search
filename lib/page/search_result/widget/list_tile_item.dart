import 'package:flutter/material.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: AppThemeColor.text.color,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppThemeColor.text.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
