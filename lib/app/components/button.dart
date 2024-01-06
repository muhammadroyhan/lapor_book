import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lapor_book/app/components/styles.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const ButtonAuth({
    Key? key,
    required this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          MediaQueryWidth,
          MediaQueryHeight * 0.07,
        ),
        backgroundColor: primaryColor,
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
