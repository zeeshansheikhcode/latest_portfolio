import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get heroTitle => GoogleFonts.spaceGrotesk(
        fontSize: 64,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -2,
        height: 1.1,
      );

  static TextStyle get heroTitleMobile => GoogleFonts.spaceGrotesk(
        fontSize: 38,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle get sectionTitle => GoogleFonts.spaceGrotesk(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -1,
      );

  static TextStyle get sectionTitleMobile => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle get cardTitle => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.textSecondary,
        height: 1.7,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.textMuted,
        height: 1.6,
      );

  static TextStyle get label => GoogleFonts.jetBrainsMono(
        fontSize: 13,
        color: AppColors.primary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get navItem => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.5,
      );

  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );
}
