import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color? imageColor;
  final Color? textColor;
  final Color? bgColor;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
    this.textColor,
    this.bgColor,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 7.0,
        child: Container( 
          width: 160,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: bgColor??Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.victorMono(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  imagePath,
                  width: 23,
                  color: imageColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}