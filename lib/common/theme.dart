import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/common/pallets.dart';


// This the apps theme and font

ThemeData buildAppTheme() {
  final base = ThemeData(
      appBarTheme: const AppBarTheme(
      ),
      brightness: Brightness.light,
      primaryColor: Pallets.textColor1,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.getTextTheme(
        'Poppins',
        TextTheme(
          titleLarge: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          headlineSmall: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          headlineMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.3),
          displaySmall: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.3),
          displayMedium: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.4),
          displayLarge: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.4),
          titleSmall: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          titleMedium: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          bodyMedium: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          bodyLarge: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
          bodySmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: Pallets.textColor1,
              fontFamily: 'Poppins',
              height: 1.2),
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: Pallets.textColor1,
        secondary: Colors.white,
      ).copyWith(secondary: Colors.white));
  return base;
}