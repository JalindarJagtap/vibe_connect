import 'package:flutter/material.dart';

class AppColors {
  // Main background colors
  static const Color background = Color(0xFFF7F3EE);
  static const Color cardBackground = Colors.white;
  static const Color overlayDark = Color(0xB3000000);
  
  // Brand & Accent colors
  static const Color primaryRose = Color(0xFFE24B66);
  static const Color secondaryRose = Color(0xFFF47B8E);
  static const Color headerPink = Color(0xFFD84B63);
  static const Color badgePink = Color(0xFFFFF0F3);
  
  // Text colors
  static const Color textPrimary = Color(0xFF1E1F24);
  static const Color textSecondary = Color(0xFF6B6E77);
  static const Color textMuted = Color(0xFF9AA0A6);
  static const Color textLight = Colors.white;
  static const Color textSectionHeader = Color(0xFFD64A62);

  // Status & Badge colors
  static const Color matchBlue = Color(0xFF4A90E2);
  static const Color trustGreen = Color(0xFF34C759);
  static const Color replyOrange = Color(0xFFFF9500);

  // Card Borders & Dividers
  static const Color divider = Color(0xFFF0ECE6);
  static const Color chipBorder = Color(0xFFF3E7EA);
  static const Color chipBackground = Color(0xFFFFFFFF);
  
  // Goal Card Gradient
  static const LinearGradient goalGradient = LinearGradient(
    colors: [Color(0xFFEC526C), Color(0xFFDD3B56)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
