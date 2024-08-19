import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{

  static final ThemeData lightMode =ThemeData(
    primaryColor: AppColors.primerColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primerColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    textTheme:  TextTheme(
      titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.white
        ),
      ),
      titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black
        ),
      ),
      titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black
        ),
      ),
    )
  );
}