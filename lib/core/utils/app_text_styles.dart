import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  // Font families
  static String poppineFontFamily = GoogleFonts.poppins(
    fontWeight: FontWeight.w900,
  ).fontFamily!;
  static String robotoFontFamily = GoogleFonts.roboto().fontFamily!;

  // ---------------- Poppins ----------------
  static TextStyle poppins32Bold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -2,
    height: 1.2,
  );

  static TextStyle poppins32BoldAlt = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    height: 1.0,
  );

  static TextStyle poppins17Regular = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins17SemiBold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins17Bold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins15Regular = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins15SemiBold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins15Bold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Regular = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Medium = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Bold = TextStyle(
    fontFamily: poppineFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.7,
  );

  // ---------------- Roboto ----------------
  static TextStyle roboto24SemiBold = TextStyle(
    fontFamily: robotoFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -2,
    height: 1.0,
  );

  static TextStyle roboto17Bold = TextStyle(
    fontFamily: robotoFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    height: 1.3,
  );

  static TextStyle roboto15SemiBold = TextStyle(
    fontFamily: robotoFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static TextStyle roboto12SemiBold = TextStyle(
    fontFamily: robotoFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  AppTextStyles._();
}
