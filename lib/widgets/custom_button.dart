import 'package:flutter/material.dart';

Color color1 = const Color.fromARGB(255, 103, 185, 226);
Color color2 = const Color.fromARGB(255, 115, 237, 180);
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = 220,
    this.color = const [Colors.white, Colors.white],
    this.textColor = Colors.black,
  });
  final String title;
  final VoidCallback onPressed;
  final double width;
  final List<Color> color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: color),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
        //Border.all(color: Colors.transparent),
      ),
      child: MaterialButton(
        elevation: 5,
        onPressed: onPressed,
        minWidth: width,
        height: 40,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'JosefinSans',
            color: textColor,
          ),
        ),
      ),
    );
  }
}