import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF6FFF8);
  static const Color primary = Color(0xFF16A34A);
  static const Color primaryLight = Color(0xFFDCFCE7);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF1E293B);
  static const Color textGrey = Color(0xFF64748B);
  static const Color gold = Color(0xFFD97706);

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: const Color(0xFF16A34A).withOpacity(0.04),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}