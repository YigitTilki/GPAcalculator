import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.indigo;

  static const String title = "Calculate Average";

  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle showAverageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 2);

  static final horizantalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
