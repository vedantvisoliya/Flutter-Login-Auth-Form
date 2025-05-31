import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final Color errorBarColor;
  final double? elevation;
  final TextInputType? inputType;
  const MyTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.errorBarColor,
    this.elevation,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation??7,
      child: Container(
        width: 350,
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: TextField(
            controller: controller, 
            obscureText: obscureText,
            keyboardType: inputType ?? TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,        
              labelStyle: GoogleFonts.victorMono(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
                borderSide: BorderSide(
                  color: errorBarColor,
                  width: 3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
                borderSide: BorderSide(
                  color: errorBarColor,
                  width: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}