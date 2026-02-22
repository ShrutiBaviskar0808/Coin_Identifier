import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const gold = Color(0xFFD4AF37);
  static const darkGold = Color(0xFFB8941E);
  static const lightGold = Color(0xFFF5E6C8);
  static const textDark = Color(0xFF2C2C2C);
  static const textGray = Color(0xFF757575);
  
  static const goldGradient = LinearGradient(
    colors: [Color(0xFFD4AF37), Color(0xFFF5E6C8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
