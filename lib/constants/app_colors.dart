import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF12121A);
  static const Color surfaceLight = Color(0xFF1A1A26);
  static const Color card = Color(0xFF16161F);
  static const Color cardBorder = Color(0xFF2A2A3D);

  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8B85FF);
  static const Color accent = Color(0xFF00D4FF);
  static const Color accentGreen = Color(0xFF00FF94);
  static const Color accentPink = Color(0xFFFF6B9D);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0C8);
  static const Color textMuted = Color(0xFF6B6B85);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF00D4FF), Color(0xFF00FF94)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
