import 'package:flutter/material.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({
    super.key,
    required String title,
    automaticallyImplyLeading = true,
    BuildContext? context,
  }) : super(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: AppThemeColor.white.color,
            ),
          ),
          backgroundColor: AppThemeColor.primaryDark.color,
          leading: automaticallyImplyLeading
              ? IconButton(
                  onPressed: () =>
                      context != null ? Navigator.of(context).pop() : null,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppThemeColor.white.color,
                  ),
                )
              : null,
        );
}
