import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sajilni/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData dark() {
    final base = GoogleFonts.notoSansArabicTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.surface,
        onPrimary: AppColors.primaryDark,
        onSurface: AppColors.textPrimary,
      ),
      dividerColor: AppColors.border,
      textTheme: base.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xCC0E1511),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
        ),
      ),
    );
  }
}
