//palette.dart
import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary = MaterialColor(
      0xFF2850E4, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
      <int, Color>{
        50: Color(0xFFE5EAFC),
        100: Color(0xFFBFCBF7),
        200: Color(0xFF94A8F2),
        300: Color(0xFF6985EC),
        400: Color(0xFF486AE8),
        500: Color(0xFF2850E4),
        600: Color(0xFF2449E1),
        700: Color(0xFF1E40DD),
        800: Color(0xFF1837D9),
        900: Color(0xFF0F27D1),
      });
} //
