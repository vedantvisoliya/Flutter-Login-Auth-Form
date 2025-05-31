import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  const MySquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 40,
          ),
        ),
      ),
    );
  }
}