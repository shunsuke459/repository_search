import 'package:flutter/material.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class LandscapeListTileItem extends StatelessWidget {
  const LandscapeListTileItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: AppThemeColor.text.color,
            ),
          ),
        ),
        Expanded(
          child: Text(
            subtitle,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppThemeColor.text.color,
            ),
          ),
        )
      ],
    );
  }
}
