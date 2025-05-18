import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.size});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        fontWeight: size == 24 ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }
}
