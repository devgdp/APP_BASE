import 'package:flutter/material.dart';
import 'package:post/src/config/themes/app_colors.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    final ThemeData base = ThemeData.light();
    return ThemeData(
        unselectedWidgetColor: AppColors.primaryColor,
        colorScheme:
            base.colorScheme.copyWith(primary: AppColors.primaryColor));
  }
}
