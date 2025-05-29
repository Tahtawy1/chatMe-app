import 'package:flutter/material.dart';

Color color1 = const Color.fromARGB(255, 103, 185, 226);
Color color2 = const Color.fromARGB(255, 115, 237, 180);

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = 220,  this.isNotSelected = false,
  });
  final String title;
  final VoidCallback onPressed;
  final double width;
  final bool isNotSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
          isNotSelected
          ?[Colors.white, Colors.white]
          :[color1, color2],
        ),
        borderRadius: BorderRadius.circular(20),
        border: isNotSelected
            ?Border.all(color: Colors.black)
            :Border.all(color: Colors.transparent)

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
