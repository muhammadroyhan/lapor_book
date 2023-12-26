import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lapor_book/app/components/styles.dart';

class TextformfielAuth extends StatelessWidget {
  const TextformfielAuth({
    Key? key,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(),
      enabled: enable,
      initialValue: initialValue,
      textAlign: TextAlign.justify,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: validator,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class TextformfielHP extends StatelessWidget {
  const TextformfielHP({
    Key? key,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(),
      enabled: enable,
      initialValue: initialValue,
      textAlign: TextAlign.justify,
      keyboardType: TextInputType.number,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: validator,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class TextformfielPassword extends StatefulWidget {
  const TextformfielPassword({
    Key? key,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  State<TextformfielPassword> createState() => _TextformfielPasswordState();
}

class _TextformfielPasswordState extends State<TextformfielPassword> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(),
      enabled: widget.enable,
      initialValue: widget.initialValue,
      textAlign: TextAlign.start,
      obscureText: widget.obscureText && !_showPassword,
      obscuringCharacter: '*',
      validator: widget.validator,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
