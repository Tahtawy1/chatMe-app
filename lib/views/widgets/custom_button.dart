import 'package:flutter/material.dart';

Color color1 = const Color.fromARGB(255, 103, 185, 226);
Color color2 = const Color.fromARGB(255, 115, 237, 180);

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed,  this.width = 220});
  final String title;
  final VoidCallback onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              title == 'Log in'
                  ? [color1, color2]
                  : [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black),
      ),
      child: MaterialButton(
        elevation: 5,
        onPressed: onPressed,
        minWidth: width,
        height: 40,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontFamily: 'JosefinSans'),
        ),
      ),
    );
  }
}
