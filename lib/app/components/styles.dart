import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xffF4A261);
Color warningColor = const Color(0xFFE9C46A);
Color dangerColor = const Color(0xFFE76F51);
Color successColor = const Color(0xFF2A9D8F);
Color greyColor = const Color(0xFFAFAFAF);

Widget textHeader(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget textAuth(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  );
}

Widget textlaporan(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );
}

var buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15),
    backgroundColor: primaryColor);
