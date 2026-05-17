import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primaryAccent,
      cardColor: AppColors.darkSurface,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryAccent,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.darkSurface,
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            bodyLarge: GoogleFonts.outfit(color: AppColors.darkTextPrimary),
            bodyMedium: GoogleFonts.outfit(color: AppColors.darkTextSecondary),
            headlineLarge: GoogleFonts.outfit(
              color: AppColors.darkTextPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.primaryAccent,
      cardColor: AppColors.lightSurface,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryAccent,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.lightSurface,
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme)
          .copyWith(
            bodyLarge: GoogleFonts.outfit(color: AppColors.lightTextPrimary),
            bodyMedium: GoogleFonts.outfit(color: AppColors.lightTextSecondary),
            headlineLarge: GoogleFonts.outfit(
              color: AppColors.lightTextPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
      useMaterial3: true,
    );
  }
}
