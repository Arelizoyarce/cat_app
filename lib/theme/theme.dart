import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryColor: const Color(0xFF6F4C3E),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      appBarTheme: AppBarTheme(
        color: const Color(0xFF6F4C3E),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        bodyLarge: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        bodyMedium: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF6F4C3E),
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: const Color(0xFFD8B18C))
          .copyWith(surface: const Color(0xFFF5F5F5)),
    );
  }
}
